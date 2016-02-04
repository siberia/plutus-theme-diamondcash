{include file="header.tpl" title="Add Beneficiary" nav="beneficiaries"}

      <div>
        <h2 class="page-header">Add beneficiary</h2>
      </div>

      <div>
{include file="_partials/success.tpl"}
{include file="_partials/errors.tpl"}

{literal}
<script>
   var banks = {
{/literal}
{foreach $banks item=row}
  '{$row.id}': '{$row.default_branch_code|string_format:"%06d"}',
{/foreach}
{literal}
  };
</script>
{/literal}


      <form method="post" class="form-horizontal" role="form">
        <input name="utf8" type="hidden" value="&#x2713;" />
{include file="_partials/csrf.tpl"}

  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Beneficiary Name</label>
    <div class="col-sm-10">
      <input type="text" name="name" class="form-control" id="inputName" placeholder="Beneficiary Name">
    </div>
  </div>
  <div class="form-group">
    <label for="inputBank" class="col-sm-2 control-label">Bank</label>
    <div class="col-sm-10">
      <select name="bank" class="form-control" id="inputBank">
        <option value="">Select Bank</option>
          {foreach $banks item=row}
        <option value="{$row.id}">{$row.bank_name} ({$row.default_branch_code|string_format:"%06d"})</option>
          {/foreach}
      </select>
    </div>
  </div>
  <div class="form-group">
    <label for="inputAccountNumber" class="col-sm-2 control-label">Account Number</label>
    <div class="col-sm-10">
      <input type="text" name="account_number" class="form-control" id="inputAccountNumber" placeholder="Account Number">
    </div>
  </div>
  <div class="form-group">
    <label for="inputBranchCode" class="col-sm-2 control-label">Branch Code</label>
    <div class="col-sm-10">
      <input type="text" name="branch_code" class="form-control" id="inputBranchCode" placeholder="Branch Code">
    </div>
  </div>
  <div class="form-group">
    <label for="inputAccountType" class="col-sm-2 control-label">Account Type</label>
    <div class="col-sm-10">
      <select name="account_type" class="form-control" id="inputAccountType">
        <option value="1">Current / Cheque Account</option>
        <option value="2">Savings account</option>
        <option value="3">Transmission account</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label for="inputYourReference" class="col-sm-2 control-label">Your Reference</label>
    <div class="col-sm-10">
      <input type="text" name="reference1" class="form-control" id="inputYourReferencee" placeholder="Your Reference">
    </div>
  </div>
  <div class="form-group">
    <label for="inputTheirReference" class="col-sm-2 control-label">Their Reference</label>
    <div class="col-sm-10">
      <input type="text" name="reference2" class="form-control" id="inputTheirReference" placeholder="Their Reference">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input data-disable-with="Processing ..." type="submit" class="btn btn-primary" value="Add Beneficiary">
    </div>
  </div>
</form>


    </div>

{include file="footer.tpl"}
