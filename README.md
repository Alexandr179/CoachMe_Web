
В SpringBoot монолитное приложение + MVC:
        Model
        View
        Controller
        
JSESSIONID - сессия 
        
*************************** SpringBoot Security *****************************
        вход в систему по имени(email)/паролю      
        
- CSRF ..по token-нам по таблице в DB, через persistentTokenRepository в congig
        (возможно запоминание по пакаметру "remember-me" или 'всегда')
 
- через встроеную реализацию.. в config: Login, Logout..
        маппинг URL-во
        успешная/неуспешн. аутентификация..
 
44.Rest_API_Spring_Boot_CSRF_tokens
------------------------------------------------------------------------------       

В SpringBoot REST:

- раздельная архитектура
- сервер предоставляет API, клиент им пользуется
 Сервер принимает и  отдает только данные. Само представление регулируется на клиенте.
  например, мобильные приложения)
   
- нет сессий и состояний
- все URL-ы - как ресурсы 

> например, все друзья клиента с id=6, которые старше 20 лет >   

  /users/6/friends?age=10

> все заказы клиента с id=6, которые зарегистрированы в компании c id=10, ..по дате

  /companies/10/clients/6/orders?


 *************************** SpringBoot Security в REST ************************         

  POST /login {username, password} -> WebApp
                            token <- 
                            
  последующий запрос..
  GET /courses
      Header : token
      
  
  CoachMe
  ------------------------------------------------------------------------------------------------    
1. 
          
        
