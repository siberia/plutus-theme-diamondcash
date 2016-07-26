{include file="header.tpl" title="Two Factor Authentication Settings" nav="settings"}

      <div>
        <h2 class=page-header">Two Factor Authentication Settings</h2>

        <hr />
      </div>

      <div>
{include file="_partials/success.tpl"}
{include file="_partials/errors.tpl"}

<p>
  Please download the Google Authenticator application from the
  <a href="https://itunes.apple.com/en/app/google-authenticator/id388497605?mt=8">App Store for iOS</a> or
  <a href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2">Google Play for Android</a>
  and scan this QR code.  Enter the verification code
  provided by the Google Authenticaticator application below to enable Two Factor Authentication.
</p>

<p>
  <img src="{$qrurl}">
</p>

{if $enabled}
    <p>
       Two factor authentication is already enabled on your account.
    </p>
{else}
      <form method="post" class="form-horizontal" role="form">
{include file="_partials/csrf.tpl"}
        <div class="form-group">
          <label for="inputName" class="col-sm-2 control-label">Enter your TFA Code</label>
          <div class="col-sm-10">
            <input type="text" name="authentication_code" class="form-control" id="inputVerifyCode" placeholder="Verify Code">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-primary">Enable TFA</button>
          </div>
        </div>
      </form>
    </div>
{/if}

{include file="footer.tpl"}
