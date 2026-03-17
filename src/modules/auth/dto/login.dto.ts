import { ApiProperty } from '@nestjs/swagger';
import { IsString } from 'class-validator';

export class LoginDto {
  @ApiProperty({ example: 'mjamoliddin2006@gmail.com' })
  @IsString()
  login: string;

  @ApiProperty({ example: '12345678' })
  @IsString()
  password: string;
}
