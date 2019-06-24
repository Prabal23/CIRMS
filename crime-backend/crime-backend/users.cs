using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
namespace Crimebackend
{
    #region Users
    public class Users
    {
        #region Member Variables
        protected int _id;
        protected string _first_name;
        protected string _last_name;
        protected unknown _user_type;
        protected bool _is_admin;
        protected int _role_id;
        protected string _email;
        protected string _password;
        protected string _image;
        protected unknown _status;
        protected DateTime _message_checked_at;
        protected int _client_id;
        protected DateTime _notification_checked_at;
        protected bool _is_primary_contact;
        protected string _job_title;
        protected bool _disable_login;
        protected unknown _note;
        protected string _address;
        protected string _alternative_address;
        protected string _phone;
        protected string _alternative_phone;
        protected unknown _dob;
        protected string _ssn;
        protected unknown _gender;
        protected unknown _sticky_note;
        protected string _skype;
        protected bool _enable_web_notification;
        protected bool _enable_email_notification;
        protected DateTime _created_at;
        protected int _deleted;
        protected DateTime _last_logged_in;
        protected string _username;
        protected string _managername;
        protected string _password_text;
        #endregion
        #region Constructors
        public Users() { }
        public Users(string first_name, string last_name, unknown user_type, bool is_admin, int role_id, string email, string password, string image, unknown status, DateTime message_checked_at, int client_id, DateTime notification_checked_at, bool is_primary_contact, string job_title, bool disable_login, unknown note, string address, string alternative_address, string phone, string alternative_phone, unknown dob, string ssn, unknown gender, unknown sticky_note, string skype, bool enable_web_notification, bool enable_email_notification, DateTime created_at, int deleted, DateTime last_logged_in, string username, string managername, string password_text)
        {
            this._first_name=first_name;
            this._last_name=last_name;
            this._user_type=user_type;
            this._is_admin=is_admin;
            this._role_id=role_id;
            this._email=email;
            this._password=password;
            this._image=image;
            this._status=status;
            this._message_checked_at=message_checked_at;
            this._client_id=client_id;
            this._notification_checked_at=notification_checked_at;
            this._is_primary_contact=is_primary_contact;
            this._job_title=job_title;
            this._disable_login=disable_login;
            this._note=note;
            this._address=address;
            this._alternative_address=alternative_address;
            this._phone=phone;
            this._alternative_phone=alternative_phone;
            this._dob=dob;
            this._ssn=ssn;
            this._gender=gender;
            this._sticky_note=sticky_note;
            this._skype=skype;
            this._enable_web_notification=enable_web_notification;
            this._enable_email_notification=enable_email_notification;
            this._created_at=created_at;
            this._deleted=deleted;
            this._last_logged_in=last_logged_in;
            this._username=username;
            this._managername=managername;
            this._password_text=password_text;
        }
        #endregion
        #region Public Properties
        public virtual int Id
        {
            get {return _id;}
            set {_id=value;}
        }
        public virtual string First_name
        {
            get {return _first_name;}
            set {_first_name=value;}
        }
        public virtual string Last_name
        {
            get {return _last_name;}
            set {_last_name=value;}
        }
        public virtual unknown User_type
        {
            get {return _user_type;}
            set {_user_type=value;}
        }
        public virtual bool Is_admin
        {
            get {return _is_admin;}
            set {_is_admin=value;}
        }
        public virtual int Role_id
        {
            get {return _role_id;}
            set {_role_id=value;}
        }
        public virtual string Email
        {
            get {return _email;}
            set {_email=value;}
        }
        public virtual string Password
        {
            get {return _password;}
            set {_password=value;}
        }
        public virtual string Image
        {
            get {return _image;}
            set {_image=value;}
        }
        public virtual unknown Status
        {
            get {return _status;}
            set {_status=value;}
        }
        public virtual DateTime Message_checked_at
        {
            get {return _message_checked_at;}
            set {_message_checked_at=value;}
        }
        public virtual int Client_id
        {
            get {return _client_id;}
            set {_client_id=value;}
        }
        public virtual DateTime Notification_checked_at
        {
            get {return _notification_checked_at;}
            set {_notification_checked_at=value;}
        }
        public virtual bool Is_primary_contact
        {
            get {return _is_primary_contact;}
            set {_is_primary_contact=value;}
        }
        public virtual string Job_title
        {
            get {return _job_title;}
            set {_job_title=value;}
        }
        public virtual bool Disable_login
        {
            get {return _disable_login;}
            set {_disable_login=value;}
        }
        public virtual unknown Note
        {
            get {return _note;}
            set {_note=value;}
        }
        public virtual string Address
        {
            get {return _address;}
            set {_address=value;}
        }
        public virtual string Alternative_address
        {
            get {return _alternative_address;}
            set {_alternative_address=value;}
        }
        public virtual string Phone
        {
            get {return _phone;}
            set {_phone=value;}
        }
        public virtual string Alternative_phone
        {
            get {return _alternative_phone;}
            set {_alternative_phone=value;}
        }
        public virtual unknown Dob
        {
            get {return _dob;}
            set {_dob=value;}
        }
        public virtual string Ssn
        {
            get {return _ssn;}
            set {_ssn=value;}
        }
        public virtual unknown Gender
        {
            get {return _gender;}
            set {_gender=value;}
        }
        public virtual unknown Sticky_note
        {
            get {return _sticky_note;}
            set {_sticky_note=value;}
        }
        public virtual string Skype
        {
            get {return _skype;}
            set {_skype=value;}
        }
        public virtual bool Enable_web_notification
        {
            get {return _enable_web_notification;}
            set {_enable_web_notification=value;}
        }
        public virtual bool Enable_email_notification
        {
            get {return _enable_email_notification;}
            set {_enable_email_notification=value;}
        }
        public virtual DateTime Created_at
        {
            get {return _created_at;}
            set {_created_at=value;}
        }
        public virtual int Deleted
        {
            get {return _deleted;}
            set {_deleted=value;}
        }
        public virtual DateTime Last_logged_in
        {
            get {return _last_logged_in;}
            set {_last_logged_in=value;}
        }
        public virtual string Username
        {
            get {return _username;}
            set {_username=value;}
        }
        public virtual string Managername
        {
            get {return _managername;}
            set {_managername=value;}
        }
        public virtual string Password_text
        {
            get {return _password_text;}
            set {_password_text=value;}
        }
        #endregion
    }
    #endregion
}