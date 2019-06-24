<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Auth;
use App\User;
use App\Wsreport;
use App\Wsphoto;
use App\Category;
use App\Problem;
use App\FollowUp;
use App\followImage;
class UserController extends Controller
{
    //
    public function login(Request $request)
    {
        $user = User::where([['first_name', $request->first_name],['last_name', $request->last_name],['username', $request->username]])
        ->orWhere([['first_name', $request->first_name], ['last_name', $request->last_name], ['password_text', $request->username]])->first();
          if(!$user){
            return response()->json([
                    'success' => false,
                    'msg' => 'Invalid Details!',
            ], 401);
         }
        return response()->json([
            'msg' => 'Login Successfull',
            'success' => true,
            'user' => $user
        ], 200);
    }
    public function register(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|string|max:255|email|unique:users',
        ]);
        $data = $request->all();
        $data['job_title'] = "Untitled";
        $data['managername'] = "admin";
        $data['username'] = $data['job_title'];
        $data['last_logged_in'] = date('Y-m-d H:i:s');
        return  User::create($data);
        
    }
    public function insertReport(Request $request)
    {
       return  Wsreport::create($request->all());
    }
    public function followUp(Request $request)
    {
        return  FollowUp::create($request->all());
    }
    public function insertReportImage(Request $request)
    {
        $value = $request->all();
        $id = $value['report_id'];
        \Log::info($id);
        
        $size = sizeof($value);
        $temp = '';
        for($i=0; $i<$size; $i++){
            $png_url = "profile-" . time() . ".jpg";
            $path = public_path() . '/uploads/' . $png_url;
            $img = $request->photo;
            $img = substr($img, strpos($img, ",") + 1);
            $data = base64_decode($img);
            $success = file_put_contents($path, $data);
            $value[$i]['photo'] = $png_url;
            $value[$i]['report_id'] = $id;
           
            $temp= Wsphoto::create($value[$i]);
        }
        // $temp= Wsphoto::create($value);
        return $temp;
    }
    public function insertflloupImage(Request $request)
    {
        $value = $request->all();
        $id = $value['follow_id'];
        \Log::info($id);
        
        $size = sizeof($value);
        $temp = '';
        for($i=0; $i<$size; $i++){
            $png_url = "profile-" . time() . ".jpg";
            $path = public_path() . '/uploads/' . $png_url;
            $img = $request->photo;
            $img = substr($img, strpos($img, ",") + 1);
            $data = base64_decode($img);
            $success = file_put_contents($path, $data);
            $value[$i]['photo'] = $png_url;
            $value[$i]['follow_id'] = $id;
           
            $temp= followImage::create($value[$i]);
        }
        // $temp= Wsphoto::create($value);
        return $temp;
    }
 
    public function getallreport($id){
        return Wsreport::with('photos')->where('reporting_person',$id)->get();
       // return User::with('report','report.photos')->where('id',$id)->get();
    }
    public function getcategory(){
        return Category::all();
    }
    public function getproblems($id){
        return problem::where('cat_id',$id)->get();
    }
    public function updateUser(Request $request){
        \Log::info($request);
        $png_url = "profile-" . time() . ".jpg";
        $path = public_path() . '/uploads/' . $png_url;
        $img = $request->image;
        $img = substr($img, strpos($img, ",") + 1);
        $data = base64_decode($img);
        $success = file_put_contents($path, $data);
        $value = $request->all();
        $value['image'] = $png_url;   
         \Log::info($value);

        return User::where('id', $value['id'])->update($value);
    }
    
    public function getAllProblems(Request $request){
        return Problem::all();
    }

    public function upload()
    {
        $png_url = "profile-" . time() . ".jpg";
        $path = public_path() . '/uploads/' . $png_url;
        $img = "data:image/gif;base64,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";
        // $img = $request->image;
        $img = substr($img, strpos($img, ",") + 1);
        $data = base64_decode($img);
        $success = file_put_contents($path, $data);
        // User::where('id', $user->id)->update([
        //     'profilePic' => $png_url,
        //     'mobile' => 1,
        //     'isPicUpdated' => 1,


        // ]);
        return response()->json([
            'success' => true,
            'message' => 'Picture has been uploaded successfully!',
            'newImage' => $png_url
        ]);
    }

    // public function insertflloupImage(Request $request)
    // {
    //     \Log::info($request);
    //     $data = $request->all();
    //     $size = sizeof($data);
    //     $img = '';
    //     for($i=0; $i<$size; $i++){
    //        $img = followImage::create($data[$i]);
    //     }
    //     return $img;
    // }
        

}
