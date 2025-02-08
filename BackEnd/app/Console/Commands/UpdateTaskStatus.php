<?php

namespace App\Console\Commands;

use App\Models\Task;
use Carbon\Carbon;
use Illuminate\Console\Command;

class UpdateTaskStatus extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'tasks:update-status';
    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Update task status automatically based on duration';

    /**
     * Execute the console command.
     */

    public function handle()
    {
        $tasks = Task::where('task_status', '!=', 'completed')->get();

        foreach ($tasks as $task) {
            $deadline = Carbon::parse($task->start_date)
                ->addDays($task->duration_in_days);

            if (Carbon::now()->isAfter($deadline)) {
                $task->update(['task_status' => 'not_completed']);
                $this->info("Task #{$task->id} updated to not_completed");
            }
        }

        $this->info('All tasks processed successfully!');
        return 0;
    }
}
