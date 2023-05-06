function! show_weather#ShowWeather() abort
  " ここに処理を書いていく
  if executable('curl')
    let cmd = "curl https://api.openai.com/v1/chat/completions -H \"Content-Type: application/json\" -H \"Authorization: Bearer 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\" -d '{\"model\": \"gpt-3.5-turbo\", \"messages\": [{\"role\": \"user\", \"content\": \"自己紹介をして下さい\"}]}'"

    let result = json_decode(system(cmd))

    if result['cod'] == 200
      echo result['weather']
      echo result['main']
    else
      echoerr result
    endif
  else
    echoerr 'error! curl not available.'
  endif
endfunction