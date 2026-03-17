/*
  Warnings:

  - The `status` column on the `Group` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `status` column on the `StudentGroup` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - A unique constraint covering the columns `[courseId]` on the table `Group` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `groupId` to the `Homework` table without a default value. This is not possible if the table is not empty.
  - Added the required column `groupId` to the `LessonVideo` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Group_courseId_name_key";

-- AlterTable
ALTER TABLE "Group" ADD COLUMN     "capacity" INTEGER NOT NULL DEFAULT 20,
DROP COLUMN "status",
ADD COLUMN     "status" "UserStatus" NOT NULL DEFAULT 'ACTIVE';

-- AlterTable
ALTER TABLE "Homework" ADD COLUMN     "groupId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "LessonVideo" ADD COLUMN     "groupId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "StudentGroup" DROP COLUMN "status",
ADD COLUMN     "status" "UserStatus" NOT NULL DEFAULT 'ACTIVE';

-- CreateIndex
CREATE UNIQUE INDEX "Group_courseId_key" ON "Group"("courseId");
