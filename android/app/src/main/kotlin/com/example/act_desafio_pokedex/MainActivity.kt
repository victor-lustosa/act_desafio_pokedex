package com.example.act_desafio_pokedex

import androidx.appcompat.app.AlertDialog
import androidx.appcompat.view.ContextThemeWrapper
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.act_desafio_pokedex/channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "showDialog") {
                val pokemonDetail = call.arguments as? Map<String, Any>

                if (pokemonDetail != null) {
                    val pokemonDetailEntity = try {
                        PokemonDetailEntity(
                            name = pokemonDetail["name"] as? String ?: "",
                            image = pokemonDetail["image"] as? String ?: "",
                            id = pokemonDetail["id"] as? String ?: "",
                            weight = pokemonDetail["weight"] as? String ?: "",
                            height = pokemonDetail["height"] as? String ?: ""
                        )
                    } catch (e: Exception) {
                        result.error("INVALID_ARGUMENTS", "Erro ao processar dados do pokemon", e.message)
                        return@setMethodCallHandler
                    }

                    showDialog(pokemonDetailEntity, result)

                } else {
                    result.error("INVALID_ARGUMENTS", "Erro ao processar dados do pokemon", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun showDialog(pokemonDetailEntity: PokemonDetailEntity, result: MethodChannel.Result) {
        runOnUiThread {
            val builder = AlertDialog.Builder(ContextThemeWrapper(this, R.style.Theme_AppCompat))
            builder.setTitle("Pokemon Info")
            builder.setMessage(
                "Id: ${pokemonDetailEntity.id}\n" +
                        "Nome: ${pokemonDetailEntity.name}\n" +
                        "Imagem: ${pokemonDetailEntity.image}\n" +
                        "Peso: ${pokemonDetailEntity.weight}\n" +
                        "Altura: ${pokemonDetailEntity.height} cm"
            )
            builder.setPositiveButton("OK") { dialog, _ ->
                dialog.dismiss()
                result.success("")
            }
            builder.setOnCancelListener {
                result.success("")
            }
            builder.show()
        }
    }

    data class PokemonDetailEntity(
        val image: String,
        val id: String,
        val name: String,
        val weight: String,
        val height: String
    )
}