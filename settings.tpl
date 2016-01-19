{*
 * Change password page.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2014-2016 Jacques Marneweck.  All rights strictly reserved.
 *}
{include file="header.tpl" title="Settings" nav="settings"}

      <div>
        <h2 class="page-header">Settings</h2>
      </div>

      <div>
{include file="_partials/success.tpl"}
{include file="_partials/errors.tpl"}

      <form method="post" class="form-horizontal" role="form">
{include file="_partials/utf8.tpl"}
{include file="_partials/csrf.tpl"}
        <div class="form-group">
          <label for="inputName" class="col-sm-2 control-label">Old Password</label>
          <div class="col-sm-10">
            <input type="password" name="old_password" class="form-control" id="inputName" placeholder="Old Password">
          </div>
        </div>
        <div class="form-group">
          <label for="inputName" class="col-sm-2 control-label">New Password</label>
          <div class="col-sm-10">
            <input type="password" name="password" class="form-control" id="inputName" placeholder="New Password">
          </div>
        </div>
        <div class="form-group">
          <label for="inputName" class="col-sm-2 control-label">Verify New Password</label>
          <div class="col-sm-10">
            <input type="password" name="confirm_password" class="form-control" id="inputName" placeholder="Verify New Password">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button data-disable-with="Processing ..." type="submit" class="btn btn-primary">Change Password</button>
          </div>
        </div>
      </form>
    </div>

{include file="footer.tpl"}
