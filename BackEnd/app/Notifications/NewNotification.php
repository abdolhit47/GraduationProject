<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class NewNotification extends Notification implements ShouldQueue
{
    use Queueable;
    protected $notifiable, $user_id;
    protected $type;
    protected $relatedModel;
    protected $message;

    public function __construct(string $type, $relatedModel, string $message)
    {
        $this->type = $type;
        $this->relatedModel = $relatedModel;
        $this->message = $message;
    }

    public function via(object $notifiable): array
    {
        return ['database']; // يمكنك إزالة 'mail' إذا لم ترد إرسال إيميل
    }

    public function toDatabase(object $notifiable): array
    {
        return [
            'type' => $this->type,
            'message' => $this->message,
            'related_model_id' => $this->relatedModel->id,

            'timestamp' => now()->toDateTimeString(),
        ];
    }

}
