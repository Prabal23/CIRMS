<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Wsreport extends Model
{
    //
    protected $fillable = [
        'manager_name', 'reporting_person', 'work_code', 'lat', 'longi', 'address', 'situation', 'report_date', 'problem_id', 'notes', 'admin_notes', 'admin_situation', 'status', 'show_status'
    ];
    public function photos()
    {
        return $this->hasMany('App\Wsphoto', 'report_id');
    }
}
