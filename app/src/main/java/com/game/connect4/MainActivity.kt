package com.game.connect4

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.ImageView
import com.game.connect4.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding:ActivityMainBinding

    private var whoseTurn = 0

        set(value) {
            field = value % 2
        }

    private var gameOver = false

    private var scoreOne = 0
    private var scoreTwo = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val players = setPlayers()

        val imgViews = getImageViews()

        initializeBoard(imgViews)

        val gameButtons = getButtons()

        val gameBoard = GameBoard(imgViews,players)

        initializeScores()

        for (col in 0..6){
            gameButtons[col].visibility = View.VISIBLE
        }

        //Buttons listeners
        for(column in 0..6){
            gameButtons[column].setOnClickListener {
                // whoseTurn should only ever be 0 or 1
                // add piece to column (whoseTurn+1)
                // Prevent whoseTurn from changing if invalid move
                if (gameBoard.addPiece(column, whoseTurn+1)) {
                    if (!gameOver && gameBoard.fourInARow()){
                        //Add one point to the winner's score
                            //Red player wins
                        if (whoseTurn+1 == 1){
                            scoreOne++
                            binding.tvP1Score.text = scoreOne.toString()
                            binding.llWinner.visibility = View.VISIBLE
                            binding.tvWinnerRed.visibility = View.VISIBLE
                            for (col in 0..6){
                                gameButtons[col].visibility = View.INVISIBLE
                            }

                            //yellow player wins
                        } else{
                            scoreTwo++
                            binding.tvP2Score.text = scoreTwo.toString()
                            binding.llWinner.visibility = View.VISIBLE
                            binding.tvWinnerYellow.visibility = View.VISIBLE
                            for (col in 0..6){
                                gameButtons[col].visibility = View.INVISIBLE
                            }
                        }
                        
                        gameOver = true
                    }
                    whoseTurn++
                }
            }
        }

        //Play again button
        binding.btnPlayAgain.setOnClickListener {
            for (col in 0..6){
                gameButtons[col].visibility = View.VISIBLE
            }
            reset(imgViews)
            gameBoard.reset()
        }

        // Reset Button
        binding.reset.setOnClickListener {
            for (col in 0..6){
                gameButtons[col].visibility = View.VISIBLE
            }
            reset(imgViews)
            gameBoard.reset()
        }

        //Restart button
        binding.restart.setOnClickListener {
            initializeScores()
            reset(imgViews)
            gameBoard.reset()
        }

    }

    private fun setPlayers(): Map<Int,Int> {
        return mapOf(1 to R.drawable.game_piece_red80, 2 to R.drawable.game_piece_yellow80)
    }

    private fun getImageViews(): Map<String, ImageView>{
        // Table 7X6 {row}{column}
        return mapOf(
            "00" to binding.token00, //this.findViewById(R.id.toke00)
            "01" to binding.token01,
            "02" to binding.token02,
            "03" to binding.token03,
            "04" to binding.token04,
            "05" to binding.token05,
            "06" to binding.token06,
            "10" to binding.token10,
            "11" to binding.token11,
            "12" to binding.token12,
            "13" to binding.token13,
            "14" to binding.token14,
            "15" to binding.token15,
            "16" to binding.token16,
            "20" to binding.token20,
            "21" to binding.token21,
            "22" to binding.token22,
            "23" to binding.token23,
            "24" to binding.token24,
            "25" to binding.token25,
            "26" to binding.token26,
            "30" to binding.token30,
            "31" to binding.token31,
            "32" to binding.token32,
            "33" to binding.token33,
            "34" to binding.token34,
            "35" to binding.token35,
            "36" to binding.token36,
            "40" to binding.token40,
            "41" to binding.token41,
            "42" to binding.token42,
            "43" to binding.token43,
            "44" to binding.token44,
            "45" to binding.token45,
            "46" to binding.token46,
            "50" to binding.token50,
            "51" to binding.token51,
            "52" to binding.token52,
            "53" to binding.token53,
            "54" to binding.token54,
            "55" to binding.token55,
            "56" to binding.token56)
    }

    private fun initializeBoard(imgViews: Map<String, ImageView>){
        // Set views (game pieces) as invisible
        for(row in 0..5){
            for(column in 0..6){
                val view = imgViews["$row$column"]
                if (view != null) {
                    view.visibility = View.INVISIBLE
                }
            }
        }
    }

    private fun getButtons(): List<Button> {
        return listOf(
            binding.button0, //findViewById(R.id.button0),
            binding.button1,
            binding.button2,
            binding.button3,
            binding.button4,
            binding.button5,
            binding.button6)
    }

    private fun reset(imgViews: Map<String, ImageView>){
        whoseTurn = 0
        gameOver = false
        // Set views as invisible
        initializeBoard(imgViews)
        binding.llWinner.visibility = View.GONE
        binding.tvWinnerRed.visibility = View.INVISIBLE
        binding.tvWinnerYellow.visibility = View.INVISIBLE

    }

    private fun initializeScores(){
        scoreOne = 0
        scoreTwo = 0
        binding.tvP1Score.text = 0.toString()
        binding.tvP2Score.text = 0.toString()

        binding.llWinner.visibility = View.GONE
        binding.tvWinnerRed.visibility = View.INVISIBLE
        binding.tvWinnerYellow.visibility = View.INVISIBLE

        binding.button0.visibility = View.VISIBLE
        binding.button1.visibility = View.VISIBLE
        binding.button2.visibility = View.VISIBLE
        binding.button3.visibility = View.VISIBLE
        binding.button4.visibility = View.VISIBLE
        binding.button5.visibility = View.VISIBLE
        binding.button6.visibility = View.VISIBLE
    }

}