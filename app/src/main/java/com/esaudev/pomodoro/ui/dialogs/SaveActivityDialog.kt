package com.esaudev.pomodoro.ui.dialogs

import android.app.AlertDialog
import android.app.Dialog
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.graphics.drawable.InsetDrawable
import android.os.Bundle
import android.view.Gravity
import android.view.LayoutInflater
import androidx.fragment.app.DialogFragment
import com.esaudev.pomodoro.databinding.DialogSaveActivityBinding

class SaveActivityDialog: DialogFragment() {

    private lateinit var binding: DialogSaveActivityBinding

    var onSaveClick: (() -> Unit)? = null
    var onCancelClick: (() -> Unit)? = null

    override fun onCreateDialog(savedInstanceState: Bundle?): Dialog {
        binding = DialogSaveActivityBinding.inflate(LayoutInflater.from(context))

        val builder = AlertDialog.Builder(requireActivity())
        builder.setView(binding.root)

        // Set click listeners
        binding.bYes.setOnClickListener {
            onSaveClick?.invoke()
            dismiss()
        }

        binding.bNo.setOnClickListener {
            onCancelClick?.invoke()
            dismiss()
        }

        val dialog = builder.create()
        dialog.window!!.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
        return dialog

    }
}