/*
  Warnings:

  - You are about to drop the column `capacity` on the `Group` table. All the data in the column will be lost.
  - The `status` column on the `Group` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `lessonStart` on the `Lesson` table. All the data in the column will be lost.
  - The `status` column on the `Room` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `contact` on the `Student` table. All the data in the column will be lost.
  - The `status` column on the `StudentGroup` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `contact` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `exprience` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `contact` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[courseId,name]` on the table `Group` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `Student` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `Teacher` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Made the column `teacherId` on table `Group` required. This step will fail if there are existing NULL values in that column.
  - Made the column `userId` on table `Group` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `email` to the `Student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `StudentGroup` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `Teacher` table without a default value. This is not possible if the table is not empty.
  - Added the required column `experience` to the `Teacher` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Group" DROP CONSTRAINT "Group_teacherId_fkey";

-- DropForeignKey
ALTER TABLE "Group" DROP CONSTRAINT "Group_userId_fkey";

-- DropIndex
DROP INDEX "Group_courseId_key";

-- DropIndex
DROP INDEX "Student_contact_key";

-- DropIndex
DROP INDEX "Teacher_contact_key";

-- DropIndex
DROP INDEX "User_contact_key";

-- AlterTable
ALTER TABLE "Course" ALTER COLUMN "status" SET DEFAULT 'ACTIVE';

-- AlterTable
ALTER TABLE "Group" DROP COLUMN "capacity",
ALTER COLUMN "teacherId" SET NOT NULL,
ALTER COLUMN "userId" SET NOT NULL,
DROP COLUMN "status",
ADD COLUMN     "status" "Status" NOT NULL DEFAULT 'ACTIVE';

-- AlterTable
ALTER TABLE "Lesson" DROP COLUMN "lessonStart";

-- AlterTable
ALTER TABLE "Room" DROP COLUMN "status",
ADD COLUMN     "status" "Status" NOT NULL DEFAULT 'ACTIVE';

-- AlterTable
ALTER TABLE "Student" DROP COLUMN "contact",
ADD COLUMN     "email" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "StudentGroup" ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "status",
ADD COLUMN     "status" "Status" NOT NULL DEFAULT 'ACTIVE';

-- AlterTable
ALTER TABLE "Teacher" DROP COLUMN "contact",
DROP COLUMN "exprience",
ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "experience" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "contact",
ADD COLUMN     "email" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Group_courseId_name_key" ON "Group"("courseId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Student_email_key" ON "Student"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Teacher_email_key" ON "Teacher"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Group" ADD CONSTRAINT "Group_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES "Teacher"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Group" ADD CONSTRAINT "Group_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentGroup" ADD CONSTRAINT "StudentGroup_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
