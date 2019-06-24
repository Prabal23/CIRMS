<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/login', 'UserController@login');
Route::post('/register', 'UserController@register');
Route::post('/insertReport', 'UserController@insertReport');
Route::post('/insertReportImage', 'UserController@insertReportImage');
Route::post('/followUp', 'UserController@followUp');
Route::post('/insertflloupImage', 'UserController@insertflloupImage');
Route::get('/getallreport/{id}', 'UserController@getallreport');
Route::get('/getcategory', 'UserController@getcategory');
Route::get('/getproblems/{id}', 'UserController@getproblems');
Route::post('/updateUser', 'UserController@updateUser');
Route::get('/getAllProblems', 'UserController@getAllProblems');

Route::get('/upload', 'UserController@upload');
