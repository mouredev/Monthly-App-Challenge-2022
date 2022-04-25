package com.esaudev.pomodoro.ui.adapters.lists

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import com.esaudev.pomodoro.core.extensions.dateToString
import com.esaudev.pomodoro.data.room.entities.ActivityDetailEntity
import com.esaudev.pomodoro.databinding.ItemActivityBinding
import com.esaudev.pomodoro.ui.adapters.viewholder.BaseViewHolder
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject

class ActivityListAdapter @Inject constructor(
    @ApplicationContext context: Context
): ListAdapter<ActivityDetailEntity, BaseViewHolder<*>>(DiffUtilCallback) {

    private object DiffUtilCallback : DiffUtil.ItemCallback<ActivityDetailEntity>() {
        override fun areItemsTheSame(oldItem: ActivityDetailEntity, newItem: ActivityDetailEntity): Boolean = oldItem.id == newItem.id
        override fun areContentsTheSame(oldItem: ActivityDetailEntity, newItem: ActivityDetailEntity): Boolean = oldItem == newItem
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): BaseViewHolder<*> {
        val itemBinding = ItemActivityBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        return BindViewHolder(itemBinding)
    }

    override fun onBindViewHolder(holder: BaseViewHolder<*>, position: Int) {
        when (holder) {
            is BindViewHolder -> holder.bind(getItem(position), position)
            else -> Unit
        }
    }

    inner class BindViewHolder(private val binding: ItemActivityBinding) : BaseViewHolder<ActivityDetailEntity>(binding.root) {
        override fun bind(item: ActivityDetailEntity, position: Int) = with(binding) {

            val workMinutes = "${item.workSeconds / 60}"
            val workSeconds = "${item.workSeconds % 60}"

            val breakMinutes ="${item.workSeconds / 60}"
            val breakSeconds = "${item.breakSeconds % 60}"

            val totalWorkAmount = "$workMinutes min $workSeconds seg"
            val totalBreakAmount = "$breakMinutes min $breakSeconds seg"

            val activityName = "Actividad: ${item.name}"
            val activityDate = "Fecha: ${item.date.dateToString("E dd-MMM hh:mm a")}"

            tvActivityName.text = activityName
            tvActivityDate.text = activityDate
            tvWorkTotalTime.text = totalWorkAmount
            tvBreakTotalTime.text = totalBreakAmount
        }
    }

    private var onExpenseClickListener : ((ActivityDetailEntity) -> Unit)? = null
    private var onDeleteExpenseClickListener : ((ActivityDetailEntity) -> Unit)? = null

    fun setExpenseClickListener(listener: (ActivityDetailEntity) -> Unit){
        onExpenseClickListener = listener
    }

    fun setDeleteExpenseClickListener(listener: (ActivityDetailEntity) -> Unit){
        onDeleteExpenseClickListener = listener
    }
}