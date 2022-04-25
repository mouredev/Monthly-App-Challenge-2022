package com.esaudev.pomodoro.core.extensions

import android.content.Context
import android.view.inputmethod.EditorInfo
import android.widget.EditText

fun EditText.clearFocusOnDoneButton(context: Context) {
    this.setOnEditorActionListener { _, action, _ ->
        if (action == EditorInfo.IME_ACTION_DONE) {
            context.hideKeyboard(this)
            this.clearFocus()
            return@setOnEditorActionListener true
        }

        return@setOnEditorActionListener false
    }
}