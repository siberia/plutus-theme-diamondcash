{include file="session__header.tpl" title="OTP Authentication"}

<p>
    Please enter your One Time Password (OTP) from the SMS sent to your phone.  Should you not receive a
    SMS within 5 minutes, please contact the Diamond Cash Call Centre on 0861 113 673.
</p>

<p>
<form action="/otp_auth" method="post" class="form-horizontal" role="form">
    {include file="_partials/csrf.tpl"}
    <div class="form-group">
        <label for="inputName" class="col-sm-2 control-label">Enter code from SMS</label>
        <div class="col-sm-10">
            <input type="text" name="authentication_code" class="form-control" id="inputVerifyCode" placeholder="Verify Code">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>
</form>
</div>
</p>

{include file="session__footer.tpl"}
