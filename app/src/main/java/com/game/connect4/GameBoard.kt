package com.game.connect4

import android.view.View
import android.widget.ImageView
import java.lang.IndexOutOfBoundsException

class GameBoard(private val views: Map<String, ImageView>, private val players: Map<Int, Int>){
    private val board = createBoard() // List of Columns

    class Column{
        val stack = mutableListOf(0,0,0,0,0,0)
        private var index = 0

        fun addPiece(piece: Int): Int {
            return if (index < 6) {
                stack[index] = piece
                index++
                index - 1
            }
            else {
                -1
            }
        }

        fun reset() {
            index = 0
            for (i in stack.indices) stack[i] = 0
        }

    }

    fun reset(){
        // Resets all values in 2D array to 0
        for (column in board) {
            column.reset()
        }
    }

    private fun createBoard(): MutableList<Column>{
        val board = mutableListOf<Column>()
        for (i in 1..7) {
            val col = Column()
            board.add(col)
        }
        return board
    }

    fun addPiece(col: Int, player: Int): Boolean {
        // update 2D array
        val row = board[col].addPiece(player)

        // update display
        if (row >= 0){
            val view = views["$row$col"]
            val drawable = players[player]
            if (view != null && drawable != null) {
                view.setImageResource(drawable)
                view.visibility = View.VISIBLE
                return true
            }
        }
        return false
    }

    fun fourInARow(): Boolean {
        /* Search 2D array left to right, bottom to top
           1) Is any token in slot
           2) Check 8 directions
           3) Pursue valid directions
        */

        // Loop through columns
        for (i in 0 until board.size) {

            for (j in 0 until board[i].stack.size) {
                // Check if not empty
                if (getValue(i,j) == 0) break
                if (checkAllAdjacent(i,j)) return true
            }
        }
        return false
    }

    private fun getValue(x: Int, y: Int): Int {
        return try{
            board[x].stack[y]
        }
        catch (e: IndexOutOfBoundsException){
            0
        }
    }

    private fun check(x: Int,y: Int,dx: Int,dy: Int): Boolean {
        // dx, dy == (-1 or 0 or 1)
        for (i in 1..4){
            if (!checkAdjacent(x,y,x+(i*dx),y+(i*dy))) {
                break
            }
            else if (i == 3) {
                return true
            }
        }
        return false
    }

    private fun checkAdjacent(x: Int,y: Int, x1: Int, y1: Int): Boolean {
        return (getValue(x,y) == getValue(x1,y1))
    }

    private fun checkAllAdjacent(x: Int,y: Int): Boolean {
        return (
                check(x,y,0,1) or
                        check(x,y,1,1) or
                        check(x,y,1,0) or
                        check(x,y,1,-1) or
                        check(x,y,0,-1) or
                        check(x,y,-1,-1) or
                        check(x,y,-1,0) or
                        check(x,y,-1,1))


    }

}