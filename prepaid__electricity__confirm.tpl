{include file="header.tpl" title="Prepaid Electricity"}
      <div>
        <h2 class="page-header">Prepaid Electricity</h2>
      </div>

      <div>
{include file="_partials/success.tpl"}
{include file="_partials/errors.tpl"}

     <form method="post" class="form-inline" role="form">
        <input name="utf8" type="hidden" value="&#x2713;" />
        <input name="step" type="hidden" value="confirm" />
{include file="_partials/csrf.tpl"}
        <input name="source" type="hidden" value="{$source}" />
        <input name="meter_number" type="hidden" value="{$meter_number}" />
        <input name="amount" type="hidden" value="{$amount}" />

        <table class="table table-border table-striped">
          <tbody>
            <tr>
              <th>Meter Number</th>
              <td>{$meter_number}</td>
            </tr>
            <tr>
              <th>Customer Name</th>
              <td>{$customer_name}</td>
            </tr>
            <tr>
              <th>Address</th>
              <td>{$address}</td>
            </tr>
            <tr>
              <th>Amount</th>
              <td>R {($amount)|number_format:2:'.':','}</td>
            </tr>
            <tr>
              <th>Utility</th>
              <td>{$utility}</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><button type="submit" class="btn btn-primary"{if $smarty.session.fica_status eq 0} disabled{/if}>Buy Now</button></td>
            </tr>
          </tbody>
        </table>
      </form>

      <div class="alert alert-info" role="alert">
        Please ensure you have entered the correct meter number as the municipalities do not allow reversals on vends of electricity.
      </div>
    </div>

{include file="footer.tpl"}
