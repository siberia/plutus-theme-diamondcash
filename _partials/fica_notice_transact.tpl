{*
 * Used for the FICA status warning messages.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2014-2015 Jacques Marneweck.  All rights strictly reserved.
 *}
{if $smarty.session.fica_status eq 0}
<div class="alert alert-info">
Please provide a certified copy of your South African Identity Document / Passport / Asylum Document before you are able to start transacting on the Diamond Cash Card system.  FICA docs can be sent to support@diamondcash.co.za or to your Diamond Cash Agent.
</div>
{/if}
