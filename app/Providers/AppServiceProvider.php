<?php

namespace App\Providers;

use App\Models\Verification;
use Illuminate\Support\ServiceProvider;
use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Notifications\Messages\MailMessage;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        VerifyEmail::createUrlUsing(function ($notifiable) {
            $code = rand(100000, 999999);

            Verification::create([
                'user_id' => $notifiable->id,
                'type' => 'email',
                'target' => $notifiable->email,
                'code' => $code,
                'expires_at' => now()->addMinutes(10),
            ]);

            return $code;
        });

        VerifyEmail::toMailUsing(function ($notifiable, $code) {
            return (new MailMessage)
                ->subject('Email Verification Code')
                ->view('emails.verify-code', [
                    'code' => $code,
                    'user' => $notifiable,
                ]);
        });

    }
}
