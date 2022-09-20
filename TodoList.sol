//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// you can check contract with given link in below
// https://rinkeby.etherscan.io/address/0xc90737726704b1A73278a515367b82c7643f8913
contract TodoList{
    struct Todo{
        string text;
        bool completed;
    }
    
    Todo[] public todos;

    //creates new To-Do
    function createTodo(string calldata _text) external{ 
        todos.push(Todo( 
            { text:_text, 
              completed:false
            }
                       ));
    }

    //getTodo function gets the to-do in the array for given index.
    function getTodo(uint256 _index) external view returns(string memory, bool){
        return (todos[_index].text , todos[_index].completed);
    }

    //replaces the to-do message for given _text.
    function updateText(uint256 _index, string memory _text) external{
        todos[_index].text=_text;
    }
    
    //it changes the value true to false, false to true for given _index.
    function changeCompletedValue(uint256 _index) external{
        todos[_index].completed = !todos[_index].completed; 
    }


}