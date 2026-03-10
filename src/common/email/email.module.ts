import { Module } from "@nestjs/common";
import { MailerModule as NestMilerModule } from '@nestjs-modules/mailer';
import { HandlebarsAdapter } from '@nestjs-modules/mailer/dist/adapters/handlebars.adapter';
import { join } from "path";

@Module({
    imports:[
        NestMilerModule.forRoot({
            transport:{
                service:"gmail",
                auth:{
                    user:"abdukhoshim99@gmail.com",
                    pass:"wlyruphmkpqtomzy"
                }
            },
            defaults:{
                from:`<n25_crm> abdukhoshim99@gmail.com`
            },
            template:{
                dir:join(process.cwd(),"template"),
                adapter: new HandlebarsAdapter(),
                options:{
                    strict:true
                }
            }
            
        })
    ]
})
export class MailerModule{}