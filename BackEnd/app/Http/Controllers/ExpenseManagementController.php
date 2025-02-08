<?php

namespace App\Http\Controllers;

use App\Models\EmloyeeSalary;
use App\Models\Expense;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;


class ExpenseManagementController extends Controller {

    public function addExpense(Request $request) {
        $validator = Validator::make($request->all(), [
            'type' => ['required', 'string', Rule::in(['operational', 'administrative', 'maintenance', 'other'])],
            'amount' => 'required|numeric|min:0',
            'notes' => 'nullable|string|max:500',
            'payment_date' => 'required|date',
        ], [
            'type.required' => 'Expense type is required.',
            'type.in' => 'Invalid expense type.',
            'amount.required' => 'Amount is required.',
            'amount.numeric' => 'Amount must be a number.',
            'notes.string' => 'Notes must be a string.',
            'payment_date.required' => 'Date is required.',
            'payment_date.date' => 'Date must be a valid date.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors(),
            ], 400);
        }

        Expense::create($validator->validated());
        return response()->json([
            'status' => 'success',
            'message' => 'Expense added successfully',
        ], 201);
    }

    public function viewExpenses() {
        $expenses = Expense::select('type','amount','notes','payment_date')->get();
        return response()->json($expenses,200);
    }

    public function editExpense(Request $request, $expenseId) {
        $expense = Expense::find($expenseId);

        if (!$expense) {
            return response()->json([
                'status' => 'error',
                'message' => 'Expense not found',
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'type' => ['nullable', 'string', Rule::in(['operational', 'administrative', 'maintenance', 'other'])],
            'amount' => 'nullable|numeric|min:0',
            'notes' => 'nullable|string|max:500',
            'payment_date' => 'nullable|date',
        ], [
            'type.in' => 'Invalid expense type.',
            'amount.numeric' => 'Amount must be a number.',
            'notes.string' => 'Notes must be a string.',
            'date.date' => 'Date must be a valid date.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()->first(),
            ], 400);
        }
        $expense->update($validator->validated());
        return response()->json([
            'status' => 'success',
            'message' => 'Expense updated successfully',
        ]);
    }

    public function addsalary(Request $request) {

        $validator = Validator::make($request->all(), [
            'employee_id' => 'required|exists:users,id',
            'final_salary' => 'required|numeric|min:0',
//            'deduction' => 'required|numeric|min:0',
//            'bonus' => 'required|numeric|min:0',
//            'payment_date' => 'required|date',
            'notes' => 'nullable|string|max:500',
        ], [
            'user_id.required' => 'User ID is required.',
            'user_id.exists' => 'User not found.',
            'final_salary.required' => 'Base salary is required.',
            'final_salary.numeric' => 'Base salary must be a number.',
//            'deduction.required' => 'Deduction is required.',
//            'deduction.numeric' => 'Deduction must be a number.',
//            'bonus.required' => 'Bonus is required.',
//            'bonus.numeric' => 'Bonus must be a number.',
//            'payment_date.required' => 'Date is required.',
//            'payment_date.date' => 'Date must be a valid date.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors(),
            ], 400);
        }

        EmloyeeSalary::create($validator->validated());
        $user = User::find($request->employee_id);
        $user->update(['salary' => $request->final_salary]);
        return response()->json([
            'status' => 'success',
            'message' => 'Expense added successfully',
        ], 201);
    }
//    public function deleteExpense($expenseId) {
//        $expense = Expense::find($expenseId);
//
//        if (!$expense) {
//            return response()->json([
//                'status' => 'error',
//                'message' => 'Expense not found',
//            ], 404);
//        }
//
//        $expense->delete();
//
//        return response()->json([
//            'status' => 'success',
//            'message' => 'Expense deleted successfully'
//        ]);
//    }

    // public function getExpensesByType(Request $request, $type) {
    //     $request->validate([
    //         'type' => [Rule::in(['salary', 'rent', 'utilities', 'maintenance', 'other'])]
    //     ]);

    //     $query = Expense::where('type', $type);

    //     if ($request->has('date_from')) {
    //         $query->whereDate('date', '>=', $request->date_from);
    //     }

    //     if ($request->has('date_to')) {
    //         $query->whereDate('date', '<=', $request->date_to);
    //     }

    //     $expenses = $query->paginate($request->input('per_page', 10));

    //     return response()->json([
    //         'status' => 'success',
    //         'type' => $type,
    //         'expenses' => $expenses
    //     ]);
    // }

    // public function getExpenseSummary(Request $request) {
    //     $query = Expense::query();

    //     if ($request->has('date_from')) {
    //         $query->whereDate('date', '>=', $request->date_from);
    //     }

    //     if ($request->has('date_to')) {
    //         $query->whereDate('date', '<=', $request->date_to);
    //     }

    //     $summary = $query->selectRaw('type, COUNT(*) as count, SUM(amount) as total_amount')
    //                     ->groupBy('type')
    //                     ->get();

    //     return response()->json([
    //         'status' => 'success',
    //         'summary' => $summary
    //     ]);
    // }
}
