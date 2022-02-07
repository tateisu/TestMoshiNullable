package jp.juggler.TestMoshiNullable

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import jp.juggler.TestMoshiNullable.databinding.ActivityMainBinding
import java.io.PrintWriter
import java.io.StringWriter

fun Throwable.getStackTraceString() =
    StringWriter().also { printStackTrace(PrintWriter(it, true)) }.toString()

class MainActivity : AppCompatActivity() {

    private val views by lazy {
        ActivityMainBinding.inflate(layoutInflater)
    }

    private fun addLog(line: String) {
        val old = views.etResult.text?.toString() ?: ""
        val newText = "${old}${if (old.isEmpty()) "" else "\n"}$line"
        views.etResult.setText(newText)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(views.root)
        views.btnTest.setOnClickListener {
            val moshi = Moshi.Builder()
                .add(KotlinJsonAdapterFactory())
                .build()
            val adapter = moshi.adapter(Entity1::class.java)
            arrayOf(
                """{"errors":null}""",
                """{"errors":{}}""",
                """{"errors":{"a":null}}""",
                """{"errors":{"a":1}}""",
            ).forEach { inputJson ->
                addLog("----")
                addLog("input: $inputJson")
                try {
                    val entity1 = adapter.fromJson(inputJson)
                    addLog("entity1=${entity1}")
                    addLog("errors=${entity1?.errors}")
                    val afterJson = adapter.toJson(entity1)
                    addLog("afterJson=$afterJson")
                } catch (ex: Throwable) {
                    Log.e("APP", "error!", ex)
                    addLog(ex.getStackTraceString())
                }
            }
        }
    }
}
