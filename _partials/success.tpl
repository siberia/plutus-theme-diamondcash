{*
 * Display a message confirming an action was completed successfully.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2013-2015 Jacques Marneweck.  All rights strictly reserved.
 *}
{if isset($smarty.session.flash.success)}
  <div class="alert alert-success" role="success">{$smarty.session.flash.success}</div>
{/if}
