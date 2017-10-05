{*
 * OTP confirmation page for transfer
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2014-2017 Jacques Marneweck.  All rights strictly reserved.
 *}
{include file="session__header.tpl" title="Transfer OTP Confirmation" nav="transfer"}

<p>
    Please enter your confirmation code from SMS.
</p>

<p>
<form action="/transfer" method="post" class="form-horizontal" role="form">
    {include file="_partials/csrf.tpl"}
    <div class="form-group">
        <label for="inputName" class="col-sm-2 control-label">Enter code from SMS</label>
        <div class="col-sm-10">
            <input type="text" name="confirmation_code" class="form-control" id="inputVerifyCode" placeholder="Verify Code">
        </div>
        {foreach $post_data item=row key=name}
        <input type="hidden" name="{$name}" value="{$row}" />
        {/foreach}
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
