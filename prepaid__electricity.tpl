{include file="header.tpl" title="Prepaid Electricity"}

      <div>
        <h2 class=page-header">Prepaid Electricity</h2>

        <hr />
      </div>

      <div>
{include file="_partials/success.tpl"}
{include file="_partials/errors.tpl"}

        <div class="row">
          <div class="col-md-6">
            <form method="post" class="form-horizontal" role="form">
              <input name="utf8" type="hidden" value="&#x2713;" />
              <input name="step" type="hidden" value="verify" />
{include file="_partials/csrf.tpl"}
        <div class="form-group">
          <label for="inputMeterNumber" class="col-sm-4 control-label">Prepaid Meter Number</label>
          <div class="col-sm-8">
          <input class="form-control" id="inputMeterNumber" type="text" name="meter_number" placeholder="Meter Number">
          </div>
        </div>
        <div class="form-group">
           <label for="inputAmount" class="col-sm-4 control-label">Amount</label>
           <div class="col-sm-8">
           <input class="form-control" id="inputAmount" type="text" name="amount" placeholder="Amount in Rands">
           </div>
        </div>
        <div class="form-group">
           <label for="inputSource" class="col-sm-4 control-label">Pay from account</label>
           <div class="col-sm-8">
           <select id="inputSource" class="form-control" name="source">
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
            <button type="submit" class="btn btn-primary"{if $smarty.session.fica_status eq 0} disabled{/if}>Buy Now</button>
            </div>
        </div>

          </div>
          <div class="col-md-6">Supported municipalities and electricity utilties:
            <ul>
              <li>Breede Valley</li>
              <li>Centlec (Bloemfontein)</li>
              <li>City of Cape Town</li>
              <li>George</li>
              <li>Kimberly</li>
              <li>Johannesburg (City Power)</li>
              <li>Stellenbosch</li>
            </ul>

            <p>
              Support for the following municipalities are coming online in the next few weeks:
            </p>

            <ul>
              <li>Durban</li>
              <li>Port Elizabeth</li>
              <li>Pretoria (Tshwane)</li>
            </ul>

          </div>
        </div>


<div class="alert alert-info" role="alert">
  Please ensure you have entered the correct meter number as the municipalities do not allow reversals on vends of electricity.
</div>


{include file="_partials/fica_notice_transact.tpl"}

      <h3>Recent Electricty Purchases</h3>

      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>Date</th>
            <th>Reference</th>
            <th>Meter Number</th>
            <th>Amount</th>
            <th>&nbsp;</th>
          </tr>
        </thead>
        <tbody>
{foreach $transactions item=row}
          <tr>
            <td>{$row.date}</td>
            <td>{$row.txn_id}</td>
            <td>{$row.meter_number}</td>
            <td>R {($row.amount/100)|string_format:"%.2f"}</td>
            <td><a href="/prepaid/electricity/{$row.uuid}">View Receipt</a></td>
          </tr>
{/foreach}
        </tbody>
      </table>


      <p>
        You can lookup the token for a transaction on your transaction view of your Diamond Wallet Account.
      </p>


    </div>

{include file="footer.tpl"}
