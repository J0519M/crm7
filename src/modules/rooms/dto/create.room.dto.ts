import { IsString, IsNumber, IsOptional, IsEnum } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { Status } from '@prisma/client';

export class CreateRoomDto {
  @ApiProperty()
  @IsString()
  name: string;

  @ApiProperty()
  @IsNumber()
  capacity: number;

  @ApiProperty({ enum: Status, required: false })
  @IsOptional()
  @IsEnum(Status)
  status?: Status;
}
