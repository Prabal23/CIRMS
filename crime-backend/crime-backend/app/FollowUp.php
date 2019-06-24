<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FollowUp extends Model
{
    //

    protected $fillable = [
        'manager_name', 'reporting_person', 'work_code', 'lat', 'longi', 'address', 'situation', 'report_date', 'problem_id', 'notes', 'status'
    ];
}
