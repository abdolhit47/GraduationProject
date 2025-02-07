<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class NewNotification extends Notification implements ShouldQueue
{
    use Queueable;

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
        return ['database', 'mail']; // يمكنك إزالة 'mail' إذا لم ترد إرسال إيميل
    }

    public function toDatabase(object $notifiable): array
    {
        return [
            'type' => $this->type,
            'message' => $this->message,
            'related_model_id' => $this->relatedModel->id,
            'url' => $this->getUrl(),
            'timestamp' => now()->toDateTimeString(),
        ];
    }

    private function getUrl(): string
    {
        switch ($this->type) {
            case 'new_order':
                return route('orders.show', $this->relatedModel);
            case 'order_status':
                return route('orders.edit', $this->relatedModel);
            case 'assigned_task':
                return route('tasks.show', $this->relatedModel);
            default:
                return url('/');
        }
    }

    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
            ->subject('إشعار جديد - ' . config('app.name'))
            ->line($this->message)
            ->action('عرض التفاصيل', $this->getUrl());
    }
}
