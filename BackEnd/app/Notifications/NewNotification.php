<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;


class NewNotification extends Notification
{
    use Queueable;
    protected $type;
    protected $model;
    protected $message;

    // أنواع الإشعارات الممكنة
    const NEW_ORDER = 'new_order';
    const ORDER_STATUS = 'order_status';
    const ASSIGNED_TASK = 'assigned_task';

    const TRANSFERORDER = 'transfer_order';
    public function __construct(string $type, $model, string $message)
    {
        $this->type = $type;
        $this->model = $model;
        $this->message = $message;
    }

    public function via(object $notifiable): array
    {

        return ['database']; // يمكنك إزالة 'mail' إذا لم ترد إرسال إيميل
    }

    public function toDatabase($notifiable)
    {
        return [
            'type' => $this->type,
            'data' => $this->message,
            'model_id' => $this->model->id, // إضافة هذا الحقل
            'model_type' => get_class($this->model), // إضافة هذا الحقل
            'timestamp' => now()->toISOString()
        ];
    }

}
