package com.example.flutter_application
//import android.content.Context
//import android.graphics.Canvas
//import android.graphics.Color
//import android.graphics.Paint
//import android.util.AttributeSet
//import android.view.View
//
//class CustomProgressBar @JvmOverloads constructor(
//    context: Context,
//    attrs: AttributeSet? = null,
//    defStyleAttr: Int = 0
//) : View(context, attrs, defStyleAttr) {
//
//    var progressNo: Double = 0.0
//        set(value) {
//            field = value
//            invalidate()  // Redraw the view with the new progress
//        }
//
//    private val backgroundPaint = Paint().apply {
//        color = Color.argb(255, 22, 22, 23)
//        style = Paint.Style.FILL
//        isAntiAlias = true
//    }
//
//    private val progressPaint = Paint().apply {
//        color = Color.GREEN
//        style = Paint.Style.FILL
//        isAntiAlias = true
//    }
//
//    override fun onDraw(canvas: Canvas) {
//        super.onDraw(canvas)
//
//        val width = width.toFloat()
//        val height = 10f
//
//        // Draw background
//        canvas.drawRoundRect(0f, 0f, width, height, 10f, 10f, backgroundPaint)
//
//        // Calculate progress width
//        val progressWidth = findWidth()
//
//        // Draw progress
//        canvas.drawRoundRect(0f, 0f, progressWidth, height, 10f, 10f, progressPaint)
//    }
//
//    private fun findWidth(): Float {
//        return when (progressNo) {
//            10.0 -> (width * 1 / 10) - 10
//            20.0 -> (width * 2 / 10) - 15
//            30.0 -> (width * 3 / 10) - 20
//            40.0 -> (width * 4 / 10) - 25
//            50.0 -> (width * 5 / 10) - 30
//            60.0 -> (width * 6 / 10) - 35
//            70.0 -> (width * 7 / 10) - 40
//            80.0 -> (width * 8 / 10) - 45
//            90.0 -> (width * 9 / 10) - 50
//            else -> width.toFloat()
//        }.toFloat()
//    }
//}



import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.util.AttributeSet
import android.view.View

class CustomProgressBar @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : View(context, attrs, defStyleAttr) {

    var progressNo: Double = 0.0
        set(value) {
            field = value
            invalidate()  // Redraw the view with the new progress
        }

    private val backgroundPaint = Paint().apply {
        color = Color.argb(255, 22, 22, 23)
        style = Paint.Style.FILL
        isAntiAlias = true
    }

    private val progressPaint = Paint().apply {
        color = Color.GREEN
        style = Paint.Style.FILL
        isAntiAlias = true
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)

        val width = width.toFloat()
        val height = 10f

        // Draw background
        canvas.drawRoundRect(0f, 0f, width, height, 10f, 10f, backgroundPaint)

        // Calculate progress width
        val progressWidth = width * (progressNo / 100).toFloat()

        // Draw progress
        canvas.drawRoundRect(0f, 0f, progressWidth, height, 10f, 10f, progressPaint)
    }
}
