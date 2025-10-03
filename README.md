# Godot State Machine

A simple and effective state machine implementation for Godot Engine projects. This state machine is designed to be easy to understand, extend, and integrate into your games.

---

## What is GDScript?

**GDScript** is the main programming language used in the Godot Engine. It is a high-level, object-oriented language that is syntactically similar to Python. GDScript is designed to be simple and easy to learn, especially for beginners, while still being powerful enough to create complex games. It is deeply integrated with the Godot API, allowing for a smooth and efficient development workflow.

---

## Core Logic

The core logic of this state machine is built around two main scripts: the `StateMachine` and the `State` + `data_types` Enum Class.

### `StateMachine.gd`

The `StateMachine.gd` script is the heart of the state machine. It is responsible for managing the different states and transitioning between them.

* **Manages States**: It holds a reference to all possible states and the current active state.
* **Handles Transitions**: It contains the logic to switch from one state to another.
* **Delegates to States**: The state machine delegates the `_ready`, `_process`, `_physics_process`, and `transition_to` calls to the current active state, ensuring that only the logic for the current state is executed.

To see the main logic, check the `StateMachine.gd` file in this repository.

### `State.gd`

The `node_state.gd` script is a base class that all other states inherit from. It defines the common interface for all states.

* **`enter()`**: This function is called when the state is first entered. It's the place to set up anything the state needs.
* **`exit()`**: This function is called when the state is exited. It's the place to clean up anything the state has created.
* **`process(delta)`**: This function is called every frame and contains the logic that should be executed for the state.
* **`physics_process(delta)`**: This function is called at a fixed interval and is used for physics-related logic.
* **`transition_to(state_name)`**: This function is used to handle input events.

To see the base state logic, check the `Player/name_state.gd` file in this repository.

---

## States

Here are the states that are implemented in this project:

* **`Idle.gd`**: *This is the default state where the character is standing still.*
* **`Walk.gd`**: *This state is active when the character is moving left or right.*
* **`Chopping.gd`**: *This state is active when the character click left mouse button to cut trees.*
* **`Tilling.gd`**: *This state is active when the character click left mouse button to till the dirt.*
* **`Watering.gd`**: *This state is active when the character click left mouse button to water the till dirt.*
---

## How to Use

To use this state machine in your Godot project, follow these steps:

1.  **Add the `StateMachine` node**: Add the `StateMachine.gd` script as a node to the scene of the object you want to control (e.g., the Player).
2.  **Add your States**: Add your state scripts (e.g., `Idle.gd`, `Walk.gd`, `Chopping.gd`) as children of the `StateMachine` node.
3.  **Set the Initial State**: In the `StateMachine.gd` script, set the initial state you want your object to be in.
4.  **Implement State Logic**: Write the specific logic for each state in its respective script.
5.  **Trigger Transitions**: In each state script, call the `StateMachine`'s transition function to switch to a new state when a condition is met (e.g., pressing a key).

---
