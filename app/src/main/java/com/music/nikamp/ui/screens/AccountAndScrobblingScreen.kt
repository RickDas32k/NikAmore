package com.music.nikamp.ui.screens

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.rounded.SwitchAccount
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import com.music.nikamp.R
import com.music.nikamp.data.model.Account

@Composable
fun AccountAndScrobblingScreen(
    signedIn: Boolean,
    account: Account?,
    channelName: String?,
    onSignIn: () -> Unit,
    onSwitchChannel: () -> Unit,
    onSignOut: () -> Unit,
    onOpenListenBrainzLogin: () -> Unit = {},
    onOpenLastfmLogin: () -> Unit = {},
    onOpenDiscord: () -> Unit = {},
    onOpenSpotify: () -> Unit = {},
    contentPadding: PaddingValues,
    modifier: Modifier = Modifier,
) {
    Column(
        modifier = modifier
            .fillMaxWidth()
            .verticalScroll(rememberScrollState())
            .padding(contentPadding),
    ) {
        Text(
            text = stringResource(R.string.account_integrations),
            style = MaterialTheme.typography.displayLarge,
            color = MaterialTheme.colorScheme.onBackground,
            modifier = Modifier.padding(start = 20.dp, end = 20.dp, top = 8.dp, bottom = 14.dp),
        )

        // Google Account card: who is signed in, which profile is listening, and the way out.
        SettingsGroup(
            footer = if (signedIn) stringResource(R.string.account_profiles_help) else null,
            topSpacing = 0.dp,
        ) {
            AccountCard(
                signedIn = signedIn,
                account = account,
                onSignIn = onSignIn,
                onClick = onSwitchChannel,
                grouped = true,
            )
            if (signedIn) {
                FullWidthDivider()
                SettingsRow(
                    icon = Icons.Rounded.SwitchAccount,
                    title = stringResource(R.string.listen_as),
                    subtitle = channelName ?: stringResource(R.string.default_youtube_profile),
                    onClick = onSwitchChannel,
                )
                FullWidthDivider()
                DestructiveRow(label = stringResource(R.string.sign_out), onClick = onSignOut)
            }
        }

        Spacer(Modifier.height(24.dp))
    }
}

/** A hairline across the whole card, for setting a destructive row apart from the rows above it. */
@Composable
private fun FullWidthDivider() {
    HorizontalDivider(thickness = 0.5.dp, color = MaterialTheme.colorScheme.outline)
}
