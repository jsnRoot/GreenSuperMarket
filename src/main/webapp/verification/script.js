const inputs = document.querySelectorAll('.otp-card-inputs input')
const button = document.querySelector('.otp-card button')
inputs.forEach(input =>{
    let lastInputStatus = 0
    input.onkeyup = (e) => {
        const currntElement = e.target
        const nextElement = input.nextElementSibling
        const prevElement = input.previousElementSibling
        if(prevElement && e.keycode ===8){
            if(lastInputStatus === 1){
                prevElement.value = ''
                prevElement.focus()

            }
            button.setAttribute('disabled',true)
            lastInputStatus = 1

        }else{
            const reg = /^[0-9]+$/
            if(!reg.test(currntElement.value)){
                currntElement.value = currntElement.value.replace(/\D/g,'')
             } else if(currntElement.value){
                if(nextElement){
                        nextElement.focus()

                    }else{
                        button.removeAttribute('disabled')
                        lastInputStatus = 0
                    }
                }

            }
        }
    }
)