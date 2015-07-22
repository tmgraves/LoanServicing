using System;
using System.Web;
using System.Web.Security;
using System.Data;
using System.Configuration.Provider;

namespace CustomProviders
{
    public class CustomMembershipUser : MembershipUser
    {
        private string _FirstName;
        private string _LastName;
        private int _IndividualID = 0;
        private string _Role;
        private int _InvestorID = 0;
        private int _BorrowerID = 0;

        public string FirstName
        {
          get { return _FirstName; }
          set { _FirstName = value; }
        }

        public string LastName
        {
            get { return _LastName; }
            set { _LastName = value; }
        }

        public int IndividualID
        {
            get { return _IndividualID; }
            set { _IndividualID = value; }
        }

        public string Role
        {
            get { return _Role; }
            set { _Role = value; }
        }

        public int InvestorID
        {
            get { return _InvestorID; }
            set { _InvestorID = value; }
        }

        public int BorrowerID
        {
            get { return _BorrowerID; }
            set { _BorrowerID = value; }
        }

        public CustomMembershipUser(string providername,
                                  string username,
                                  object providerUserKey,
                                  string email,
                                  string passwordQuestion,
                                  string comment,
                                  bool isApproved,
                                  bool isLockedOut,
                                  DateTime creationDate,
                                  DateTime lastLoginDate,
                                  DateTime lastActivityDate,
                                  DateTime lastPasswordChangedDate,
                                  DateTime lastLockedOutDate,
                                  string firstName,
                                  string lastName,
                                  string role,
                                  int individualID,
                                  int borrowerID,
                                  int investorID) :
            base(providername,
                                       username,
                                       providerUserKey,
                                       email,
                                       passwordQuestion,
                                       comment,
                                       isApproved,
                                       isLockedOut,
                                       creationDate,
                                       lastLoginDate,
                                       lastActivityDate,
                                       lastPasswordChangedDate,
                                       lastLockedOutDate)
        {
            this.FirstName = firstName;
            this.LastName = lastName;
            this.Role = role;
            this.IndividualID = individualID;
            this.InvestorID = investorID;
            this.BorrowerID = borrowerID;
        }
    }

    public class CustomMembershipProvider : SqlMembershipProvider
    {
        public override bool ValidateUser(string name, string password)
        {
            if (IndividualsBLL.ValidateUser(name, password))
            {
                DataTable dtIndividual = IndividualsBLL.SearchByEmail(name).Tables[0];
                HttpContext.Current.Session["IndividualID"] = dtIndividual.Rows[0]["IndividualID"].ToString();
                HttpContext.Current.Session["FirstName"] = dtIndividual.Rows[0]["FirstName"].ToString();
                HttpContext.Current.Session["LastName"] = dtIndividual.Rows[0]["LastName"].ToString();
                HttpContext.Current.Session["Email"] = dtIndividual.Rows[0]["Email"].ToString();
                //ProfileCommon profile = (ProfileCommon)ProfileCommon.Create(name, true);
                //profile.IndividualID = Convert.ToInt32(dtIndividual.Rows[0]["IndividualID"].ToString());
                //profile.FirstName = dtIndividual.Rows[0]["FirstName"].ToString();
                //profile.LastName = dtIndividual.Rows[0]["LastName"].ToString();
                //profile.Gender = dtIndividual.Rows[0]["Gender"].ToString();
                //profile.Save();
                return true;
            }
            else
            {
                return false;
            }
        }

        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            try
            {
                ValidatePasswordEventArgs Args = new ValidatePasswordEventArgs(username, newPassword, false);

                OnValidatingPassword(Args);

                if (!Args.Cancel)
                {
                    if (ValidateUser(username, oldPassword))
                    {
                        DataTable dtIndividual = IndividualsBLL.SearchByEmail(username).Tables[0];
                        if (dtIndividual.Rows.Count == 1)
                        {
                            IndividualsBLL.UpdatePassword(Convert.ToInt32(dtIndividual.Rows[0]["IndividualID"].ToString()), newPassword);
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        {
            ValidatePasswordEventArgs args =
              new ValidatePasswordEventArgs(username, password, true);

            OnValidatingPassword(args);

            if (args.Cancel)
            {
                status = MembershipCreateStatus.InvalidPassword;
                return null;
            }

            else if (RequiresUniqueEmail && GetUserNameByEmail(email) != "")
            {
                status = MembershipCreateStatus.DuplicateEmail;
                return null;
            }

            else
            {
                if (providerUserKey == null)
                {
                    providerUserKey = Guid.NewGuid();
                }

                status = MembershipCreateStatus.Success;
                MembershipUser mUser = new MembershipUser(this.Name,
                                                            email,
                                                            providerUserKey,
                                                            email,
                                                            passwordQuestion,
                                                            null,
                                                            isApproved,
                                                            false,
                                                            DateTime.Today,
                                                            DateTime.Today,
                                                            DateTime.Today,
                                                            DateTime.Today,
                                                            DateTime.Today);
                return mUser;
            }
        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override int GetNumberOfUsersOnline()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override string GetPassword(string username, string answer)
        {
            DataSet dsIndividual = IndividualsBLL.SearchByEmail(username);

            if (dsIndividual.Tables[0].Rows.Count == 1)
            {
                return dsIndividual.Tables[0].Rows[0]["Password"].ToString();
            }
            else return null;
            //  throw new Exception("The method or operation is not implemented.");
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            DataTable dtIndividual = IndividualsBLL.SearchByEmail(username).Tables[0];

            if (dtIndividual.Rows.Count == 1)
            {
                string strEmail = dtIndividual.Rows[0]["Email"].ToString();
                string strPasswordQuestion = null;
                string strComment = null;
                bool isApproved = true;
                DateTime dtCreate = DateTime.Today;
                DateTime dtLastLogin = DateTime.Today;
                DateTime dtLastActivity = DateTime.Today;
                DateTime dtLastPassChange = DateTime.Today;
                int intIndividualID = Int32.Parse(dtIndividual.Rows[0]["IndividualID"].ToString());
                bool isLockedOut = false;
                DateTime dtLastLockoutDate = DateTime.Today;

                MembershipUser mUser = new MembershipUser(this.Name,
                                                            strEmail,
                                                            intIndividualID,
                                                            strEmail,
                                                            strPasswordQuestion,
                                                            strComment,
                                                            isApproved,
                                                            isLockedOut,
                                                            dtCreate,
                                                            dtLastLogin,
                                                            dtLastActivity,
                                                            dtLastPassChange,
                                                            dtLastLockoutDate);
                return mUser;
            }

            return null;
            //  throw new Exception("The method or operation is not implemented.");
        }

        public override string GetUserNameByEmail(string email)
        {
            DataTable dtIndividual = IndividualsBLL.SearchByEmail(email).Tables[0];
            if (dtIndividual.Rows.Count == 1)
            {
                return dtIndividual.Rows[0]["Username"].ToString();
            }
            else
            {
                return "";
            }
        }

        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            base.Initialize(name, config);
        }

        protected override void OnValidatingPassword(ValidatePasswordEventArgs e)
        {
            System.Text.RegularExpressions.Regex r = new System.Text.RegularExpressions.Regex(PasswordStrengthRegularExpression);

            if (!r.IsMatch(e.Password))
            {
                e.FailureInformation = new HttpException("Password must be at least " + MinRequiredPasswordLength.ToString() + " characters long and " +
                                    "contain at least one special character.");
                e.Cancel = true;
            }
        }

        public override string ResetPassword(string username, string answer)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override bool UnlockUser(string userName)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override void UpdateUser(MembershipUser user)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        protected override byte[] EncryptPassword(byte[] password)
        {
            return base.EncryptPassword(password);
        }

        protected override byte[] DecryptPassword(byte[] encodedPassword)
        {
            return base.DecryptPassword(encodedPassword);
        }

        public override bool Equals(object obj)
        {
            return base.Equals(obj);
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public override string ToString()
        {
            return base.ToString();
        }

        // All members needed to overrride the default provider
        public override string ApplicationName
        {
            get
            {
                throw new Exception("The method or operation is not implemented.");
            }
            set
            {
                throw new Exception("The method or operation is not implemented.");
            }
        }

        public override string Description
        {
            get
            {
                return base.Description;
            }
        }

        public override bool EnablePasswordReset
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        public override bool EnablePasswordRetrieval
        {
            get
            {
                return true;
            }
            //  get { throw new Exception("The method or operation is not implemented."); }
        }

        public override int MaxInvalidPasswordAttempts
        {
            get { return 3; }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get { return 1; }
        }

        public override int MinRequiredPasswordLength
        {
            get { return 8; }
        }

        public override string Name
        {
            get
            {
                return base.Name;
            }
        }

        public override int PasswordAttemptWindow
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        public override MembershipPasswordFormat PasswordFormat
        {
            get
            {
                return MembershipPasswordFormat.Clear;
            }
            //  get { throw new Exception("The method or operation is not implemented."); }
        }

        public override string PasswordStrengthRegularExpression
        {
            //  @"(?=.{8,})(?=(.*\d){1,})(?=(.*\W){1,})"
            get { return @"(?=.{8,})(?=(.*\W){1,})"; }
        }

        public override bool RequiresQuestionAndAnswer
        {
            get
            {
                return false;
            }
            //  get { throw new Exception("The method or operation is not implemented."); }
        }

        public override bool RequiresUniqueEmail
        {
            get
            {
                return true;
            }
            //  get { throw new Exception("The method or operation is not implemented."); }
        }
    }

    public class CustomRoleProvider : SqlRoleProvider
    {
        public override string[] GetRolesForUser(string username)
        {
            try
            {
                DataTable dtMember = IndividualsBLL.SearchByEmail(username).Tables[0];

                if (dtMember.Rows.Count > 0)
                {
                    string[] roles = new string[3];
                    if (bool.Parse(dtMember.Rows[0]["IsAdministrator"].ToString()))
                    {
                        roles[0] = "Administrator";
                    }
                    else
                    {
                        roles[0] = "";
                    }
                    if (bool.Parse(dtMember.Rows[0]["IsBorrower"].ToString()))
                    {
                        roles[1] = "Borrower";
                    }
                    else
                    {
                        roles[1] = "";
                    }
                    if (bool.Parse(dtMember.Rows[0]["IsInvestor"].ToString()))
                    {
                        roles[2] = "Investor";
                    }
                    else
                    {
                        roles[2] = "";
                    }
                    return roles;
                }
                else
                {
                    return new string[0];
                }
            }
            catch (Exception ex)
            {
                return new string[0];
            }
        }
    }
}