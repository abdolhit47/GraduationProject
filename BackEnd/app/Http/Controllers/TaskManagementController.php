<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;

class TaskManagementController extends Controller {

    public function index() {
        if(Auth::user()->role == 'manager' || Auth::user()->role == 'general_manager') {
            $tasks = Task::select('id', 'task_name', 'task_details', 'start_date', 'end_date','duration_in_days', 'task_status', 'employee_id')
                ->where('task_status', 'pending')->get();
        }else {
            $tasks = Task::select('id', 'task_name', 'task_details', 'start_date', 'end_date', 'duration_in_days', 'task_status', 'employee_id')
                ->where('employee_id', Auth::user()->id)
                ->where('task_status', 'pending')->get();
        }
        $tasks = $tasks->map(function ($task) {
            if($task->duration_in_days == 1) {
                $task->duration_in_days = 'اليوم';
            }else if($task->duration_in_days == 2) {
                $task->duration_in_days = 'يومين';
            }else if($task->duration_in_days > 2) {
                $task->duration_in_days = $task->duration_in_days . ' أيام';
            }
            return [
                'id' => $task->id,
                'task_name' => $task->task_name,
                'task_details' => $task->task_details,
                'start_date' => $task->start_date,
                'end_date' => $task->end_date,
                'duration_in_days' => $task->duration_in_days,
                'task_status' => $task->task_status,
            ];
        }) ;
        return response()->json($tasks, 200);
    }

    public function addTask(Request $request) {
        $validator = Validator::make($request->all(), [
            'task_name' => ['required', 'string', 'max:255'],
            'task_details' => ['required', 'string', 'max:1000'],
            'duration_in_days' => ['required', 'integer', 'min:1'],
            'employee_id' => ['required', 'exists:users,id'],
        ],[
            'task_name.required' => 'Task name is required',
            'task_details.required' => 'Task details are required',
            'duration_in_days.required' => 'Duration in days is required',
            'employee_id.required' => 'Employee ID is required',
            'employee_id.exists' => 'Employee ID is invalid',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
            ], 400);
        }
        $validator->setData($validator->getData() + ['start_date' => Carbon::now()->format('Y-m-d'),
//                'end_date' => Carbon::now()->addDays(intval($validator->getData()['duration_in_days']))->format('Y-m-d')
            ]);
        Task::create($validator->getData());
        return response()->json('Task status added successfully', 200);
    }

    public function completeTask() {
        $tasks = Task::select('id', 'task_name', 'task_details', 'start_date', 'end_date', 'task_status', 'employee_id')
            ->where('employee_id', Auth::user()->id)
            ->where('task_status', 'completed')->get();
        return response()->json($tasks,200);
    }

    public function notCompleteTask() {
        $tasks = Task::select('id', 'task_name', 'task_details', 'start_date', 'end_date', 'employee_id')
            ->where('employee_id', Auth::user()->id)
            ->where('task_status', 'not_completed')->get();
        return response()->json($tasks,200);
    }
    public function updateTaskStatus($taskId) {
        $task = Task::find($taskId);
        if (!$task) {
            return $this->errorResponse('Task not found', 404);
        }
        if($task->task_status == 'completed') {
            return $this->errorResponse('Task already completed', 403);
        }
        $task->end_date = Carbon::now()->format('Y-m-d');
        $task->task_status = 'completed';
        $task->save();
        return response()->json('Task status updated successfully', 200);
    }

    public function deleteTask($taskId) {
        $task = Task::findOrFail($taskId);

        // Prevent deleting completed tasks
        if ($task->status === 'completed') {
            return $this->errorResponse('Cannot delete completed tasks.', 403);
        }

        $task->delete();
        return $this->successResponse(null, 'Task deleted successfully');
    }

}
