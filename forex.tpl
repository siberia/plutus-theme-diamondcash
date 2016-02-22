{*
 * Forex landing page
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2014-2016 Jacques Marneweck.  All rights strictly reserved.
 *}
{include file="header.tpl" title="Forex" nav="forex"}

      <div>
        <h2 class="page-header">Forex</h2>
      </div>

{include file="_partials/errors.tpl"}

      <p>
        Need to ensure that Asylum seekers are asked for their Passport information to use this.
      </p>

      <form method="post" action="/forex/foreignpassport" class="form-horizontal" role="form">
        <input name="utf8" type="hidden" value="&#x2713;" />
{include file="_partials/csrf.tpl"}
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Passport Number</label>
    <div class="col-sm-10">
      <input type="text" name="passport_number" class="form-control" id="inputName" placeholder="Passport Number">
    </div>
  </div>
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Country of Issue</label>
    <div class="col-sm-10">
      <select name="bank" class="form-control" id="inputBank">
        <option value="">Select Country</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Upload Passport</label>
    <div class="col-sm-10">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input data-disable-with="Processing ..." type="submit" class="btn btn-primary" value="Add Beneficiary">
    </div>
  </div>
      </form>



      <hr />
        <h3 class="page-header">Register for Forex</h3>

        <p>
          In order to send forex, please supply your proof of income (and if fica_status == 1) proof of addresss.
        </p>


      <form method="post" action="/forex/proofofincome" class="form-horizontal" role="form">
        <input name="utf8" type="hidden" value="&#x2713;" />
{include file="_partials/csrf.tpl"}
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Income</label>
    <div class="col-sm-10">
      <input type="text" name="income" class="form-control" id="inputName" placeholder="Income Amount">
    </div>
  </div>
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Income Frequency</label>
    <div class="col-sm-10">
      <select name="bank" class="form-control" id="inputBank">
        <option value="">Select Income Frequency</option>
        <option value="7">Weekly</option>
        <option value="14">Fortnightly</option>
        <option value="30">Monthly</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Upload Proof of Income</label>
    <div class="col-sm-10">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input data-disable-with="Processing ..." type="submit" class="btn btn-primary" value="Add Beneficiary">
    </div>
  </div>
      </form>
        <p>
          Please submit your documentation to our call center at <a href="mailto:support@imogo.co.za?subject=IMOGO%20Forex">support@imogo.co.za</a>.
        </p>

      <hr />
        <h3 class="page-header">Send Forex</h3>

        <h4 class="page-header">Pending Transactions</h4>

        <h4 class="page-header">Last 10 Sent Transactions</h4>

      </div>

{include file="footer.tpl"}
