import { ApiProperty } from "@nestjs/swagger"
import { IsString } from "class-validator"

export class LoginDto{
    @ApiProperty({example:"abdukhoshim99@gmial.com"})
    @IsString()
    login:string

    @ApiProperty({example:"12345678"})
    @IsString()
    password:string
}