command! Gpt call gpt#Gpt(<f-args>)

function! gpt#Gpt(contents) abort
  if executable('curl')
    let cmd = "curl https://api.openai.com/v1/chat/completions -H \"Content-Type: application/json\" -H \"Authorization: Bearer ".g:gpt_api_key."\" -d '{\"model\": \"gpt-3.5-turbo\", \"messages\": [{\"role\": \"user\", \"content\": ".a:contents."}]}'"
    echo cmd
    "  let result = json_decode(system(cmd))
    let result = system(cmd)
    echo result
  else
    echoerr 'error! curl not available.'
  endif
endfunction