{*
 * Email Notification of Payment Modal
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2014-2017 Jacques Marneweck.  All rights strictly reserved.
 *}
<div class="modal fade" id="notificationOfPaymentModal" tabindex="-1" role="dialog" aria-labelledby="notificationOfPaymentModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="notificationOfPaymentModalLabel">Email Notification of Payment</h4>
      </div>
      <div class="modal-body">
        <form method="post">
{include file="../_partials/csrf.tpl"}
          <input name="txn_ref" value="">
          <div class="form-group">
            <label for="recipient-name" class="control-label">Recipient:</label>
            <input type="text" name="email_address" class="form-control" id="recipient-name">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>
