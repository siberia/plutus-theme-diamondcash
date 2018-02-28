{include file="header.tpl" title="Purchase Prepaid Airtime" nav="prepaid"}

      <div>
        <h2 class="page-header">Prepaid Airtime</h2>
      </div>

      <div>
{include file="_partials/success.tpl"}
{include file="_partials/errors.tpl"}

<div class="row">
  <div class="col-md-6">

     <form method="post" class="form-horizontal" role="form">
        <input name="utf8" type="hidden" value="&#x2713;" />
{include file="_partials/csrf.tpl"}
        <div class="form-group">
          <label for="inputNetwork" class="col-sm-4 control-label">Select the voucher</label>
          <div class="col-sm-8">
              <select class="form-control" name="network" id="inputNetwork">
                  <option value="none">Please select a network</option>
                  <option value="vodacom">Vodacom</option>
                  <option value="mtn">MTN</option>
                  <option value="cellc">Cell C</option>
                  <option value="virginmobile">Virgin Mobile</option>
                  <option value="telkommobile">Telkom Mobile</option>
                  <option value="telkom">Telkom</option>
                  <option value="neotel">Neotel</option>
              </select>
          </div>
        </div>
        <div id="vouchers">
        <div class="form-group">
          <label for="inputVoucher" class="col-sm-4 control-label">Select the voucher</label>
          <div class="col-sm-8">
              <select class="form-control" name="voucher" id="voucher">
              </select>
          </div>
        </div>
        </div>
        <div class="form-group">
          <label for="inputMSISDN" class="col-sm-4 control-label">Recipients <acronym="Phone Number">MSISDN</acronym></label>
          <div class="col-sm-8">
          <input class="form-control" id="inputMSISDN" type="text" name="msisdn" placeholder="Phone Number">
          </div>
        </div>
        <div class="form-group">
          <label for="inputSource" class="col-sm-4 control-label">Pay from account</label>
          <div class="col-sm-8">
<select name="source" class="form-control" id="inputSource">
{foreach $accounts item=row}
{if $row.account_type eq 'wallet'}
                 <option value="{$row.uuid}"{if isset($smarty.post.source) && $smarty.post.source eq $row.uuid} selected{/if}>Diamond Wallet Account &mdash; {$row.account_number} (R {($row.balance/100)|string_format:"%.2f"})</option>
{else}
{* Other account types cannot purchase electricity at the moment. *}
{/if}
{/foreach}
      </select>
          </div>
        </div>

  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">
      <button data-disable-with="Processing ..." type="submit" class="btn btn-primary"{if $smarty.session.fica_status eq 0} disabled{/if}>Buy Now</button>
    </div>
  </div>
</div>
<div class="col-md-6">
<img width="500" src="/images/products/airtime/woman-on-phone.jpg">
</div>
</div>

{include file="_partials/fica_notice_transact.tpl"}
</form>
      <h3>Recent Airtime Purchases</h3>

      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>Date</th>
            <th>Reference</th>
            <th>Mobile Phone</th>
            <th>Amount</th>
          </tr>
        </thead>
        <tbody>
{foreach $transactions item=row}
          <tr>
            <td>{$row.date}</td>
            <td>{$row.txn_id}</td>
            <td>{$row.msisdn}</td>
            <td>R {($row.amount/100)|string_format:"%.2f"}</td>
          </tr>
{/foreach}
        </tbody>
      </table>

      <p>
        You can lookup the token for a transaction on your transaction view of your Diamond Cash Account.
      </p>
    </div>

{include file="footer.tpl"}
