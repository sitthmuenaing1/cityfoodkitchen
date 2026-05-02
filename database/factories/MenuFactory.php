<?php

namespace Database\Factories;

<<<<<<< HEAD
use Illuminate\Database\Eloquent\Factories\Factory;

class MenuFactory extends Factory
{
    public function definition(): array
    {
        return [
            'name' => $this->faker->word(),
            'price' => $this->faker->numberBetween(10, 100),
            'description' => $this->faker->sentence(),
        ];
    }
}
=======
use App\Models\Menu;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Menu>
 */
class MenuFactory extends Factory
{
    protected $model = Menu::class;

    public function definition(): array
    {
        return [
            'mtid' => 1,
            'name' => $this->faker->words(2, true),
            'price' => $this->faker->numberBetween(5, 50),
            'image' => null,
        ];
    }
}
>>>>>>> 9eb146a (update files)

