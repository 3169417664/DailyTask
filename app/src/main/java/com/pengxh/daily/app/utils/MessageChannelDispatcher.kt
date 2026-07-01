package com.pengxh.daily.app.utils

import android.content.Context
import android.util.Log
import com.pengxh.kt.lite.utils.SaveKeyValues

class MessageChannelDispatcher(private val context: Context) {
    private val kTag = "MessageChannelDispatcher"
    private val httpRequestManager by lazy { HttpRequestManager(context) }
    private val emailManager by lazy { EmailManager(context) }

    fun send(title: String, content: String, onSuccess: (() -> Unit)? = null) {
        val type = SaveKeyValues.getValue(Constant.CHANNEL_TYPE_KEY, 0) as Int
        when (type) {
            0 -> httpRequestManager.sendMessage(title, content)
            1 -> emailManager.sendEmail(title, content, false, onSuccess = onSuccess)
            else -> Log.d(kTag, "sendChannelMessage: 消息渠道不支持")
        }
    }

    fun sendWithAttachment(
        title: String,
        content: String,
        filePath: String,
        onSuccess: (() -> Unit)? = null
    ) {
        val type = SaveKeyValues.getValue(Constant.CHANNEL_TYPE_KEY, 0) as Int
        when (type) {
            0 -> {
                httpRequestManager.sendMessage(title, content)
                onSuccess?.invoke()
            }
            1 -> emailManager.sendAttachmentEmail(title, content, filePath, false, onSuccess = onSuccess)
            else -> Log.d(kTag, "sendChannelMessage: 消息渠道不支持")
        }
    }
}
