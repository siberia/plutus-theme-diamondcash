{*
 * Customers dashboard - shows their accounts page.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2014-2017 Jacques Marneweck.  All rights strictly reserved.
 *}
{include file="header.tpl" title="SMS Page" nav="sms"}

      <div>
        <h2 class="page-header">SMS</h2>
      </div>

      <div>
{include file="_partials/success.tpl"}
{include file="_partials/errors.tpl"}

      <form method="post" class="form-horizontal" role="form">
        <input name="utf8" type="hidden" value="&#x2713;" />
{include file="_partials/csrf.tpl"}
  <div class="form-group">
    <label for="inputRecipient3" class="col-sm-2 control-label">Recipient</label>
    <div class="col-sm-10">
      <input type="tel" name="recipient" class="form-control" id="inputRecipient3" placeholder="Recipient">
    </div>
  </div>
  <div class="form-group">
    <label for="inputMessage3" class="col-sm-2 control-label">Message</label>
    <div class="col-sm-10">
      <textarea row="4" name="message" class="form-control" id="inputMessage3" placeholder="Message"></textarea>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary"{if $smarty.session.fica_status eq 0} disabled{/if}>Send Message</button>
    </div>
  </div>
</form>
{include file="_partials/fica_notice_transact.tpl"}

    </div>

<h3 class="page-header">Sent SMS History</h3>


{include file="footer.tpl"}
