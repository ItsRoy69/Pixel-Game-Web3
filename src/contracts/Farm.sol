pragma solidity >=0.6.0 <0.8.0;
pragma experimental ABIEncoderV2;

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

contract ERC20 is Context, IERC20, IERC20Metadata {
    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * The default value of {decimals} is 18. To select a different value for
     * {decimals} you should overload it.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5.05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless this function is
     * overridden;
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * NOTE: If `amount` is the maximum `uint256`, the allowance is not updated on
     * `transferFrom`. This is semantically equivalent to an infinite approval.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * NOTE: Does not update the allowance if the current allowance
     * is the maximum `uint256`.
     *
     * Requirements:
     *
     * - `from` and `to` cannot be the zero address.
     * - `from` must have a balance of at least `amount`.
     * - the caller must have allowance for ``from``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, _allowances[owner][spender] + addedValue);
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        address owner = _msgSender();
        uint256 currentAllowance = _allowances[owner][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }

        return true;
    }

    /**
     * @dev Moves `amount` of tokens from `sender` to `recipient`.
     *
     * This internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `from` must have a balance of at least `amount`.
     */
    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(from, to, amount);

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - amount;
        }
        _balances[to] += amount;

        emit Transfer(from, to, amount);

        _afterTokenTransfer(from, to, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        unchecked {
            _balances[account] = accountBalance - amount;
        }
        _totalSupply -= amount;

        emit Transfer(account, address(0), amount);

        _afterTokenTransfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Spend `amount` form the allowance of `owner` toward `spender`.
     *
     * Does not update the allowance amount in case of infinite allowance.
     * Revert if not enough allowance is available.
     *
     * Might emit an {Approval} event.
     */
    function _spendAllowance(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
            unchecked {
                _approve(owner, spender, currentAllowance - amount);
            }
        }
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

    /**
     * @dev Hook that is called after any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * has been transferred to `to`.
     * - when `from` is zero, `amount` tokens have been minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens have been burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}
}

abstract contract ERC20Burnable is Context, ERC20 {
    /**
     * @dev Destroys `amount` tokens from the caller.
     *
     * See {ERC20-_burn}.
     */
    function burn(uint256 amount) public virtual {
        _burn(_msgSender(), amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, deducting from the caller's
     * allowance.
     *
     * See {ERC20-_burn} and {ERC20-allowance}.
     *
     * Requirements:
     *
     * - the caller must have allowance for ``accounts``'s tokens of at least
     * `amount`.
     */
    function burnFrom(address account, uint256 amount) public virtual {
        _spendAllowance(account, _msgSender(), amount);
        _burn(account, amount);
    }
}

contract PIMIToken is ERC20, ERC20Burnable {
  address public minter;
  address private owner;

  event MinterChanged(address indexed from, address to);

  constructor() payable ERC20("Pixel Mine", "PIMI") {
    owner = msg.sender;
  }

  function passMinterRole(address newMinter) public returns (bool) {
    require(minter==address(0) || msg.sender==minter, "You are not minter");
    minter = newMinter;

    emit MinterChanged(msg.sender, newMinter);
    return true;
  }
  
  function getOwner() public view returns (address) {
      return owner;
  }

  function mint(address account, uint256 amount) public {
    require(minter == address(0) || msg.sender == minter, "You are not the minter");
		_mint(account, amount);
	}

  function burn(address account, uint256 amount) public {
    require(minter == address(0) || msg.sender == minter, "You are not the minter");
		_burn(account, amount);
	}
	
  function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        if (msg.sender == minter) {
            _transfer(sender, recipient, amount);
            return true;
        }
        
        super.transferFrom(sender, recipient, amount);
       return true;
    }
}
// Items, NFTs or resources
interface ERCItem {
    function mint(address account, uint256 amount) external;
    function burn(address account, uint256 amount) external;
    function balanceOf(address acount) external returns (uint256);
    
    // Used by resources - items/NFTs won't have this will this be an issue?
    function stake(address account, uint256 amount) external;
    function getStaked(address account) external returns(uint256);
}

contract FarmV2 {
    using SafeMath for uint256;

    PIMIToken private token;

    struct Square {
        Fruit fruit;
        uint createdAt;
    }

    struct V1Farm {
        address account;
        uint tokenAmount;
        uint size;
        Fruit fruit;
    }

    uint farmCount = 0;
    bool isMigrating = true;
    mapping(address => Square[]) fields;
    mapping(address => uint) syncedAt;
    mapping(address => uint) rewardsOpenedAt;

    constructor(PIMIToken _token) public {
        token = _token;
    }
    
    // Need to upload these in batches so separate from constructor
    function uploadV1Farms(V1Farm[] memory farms) public {
        require(isMigrating, "MIGRATION_COMPLETE");

        uint decimals = token.decimals();
        
        // Carry over farms from V1
        for (uint i=0; i < farms.length; i += 1) {
            V1Farm memory farm = farms[i];

            Square[] storage land = fields[farm.account];
            
            // Treat them with a ripe plant
            Square memory plant = Square({
                fruit: farm.fruit,
                createdAt: 0
            });
            
            for (uint j=0; j < farm.size; j += 1) {
                land.push(plant);
            }

            syncedAt[farm.account] = block.timestamp;
            rewardsOpenedAt[farm.account] = block.timestamp;
            
            token.mint(farm.account, farm.tokenAmount * (10**decimals));
            
            farmCount += 1;
        }
    }
    
    function finishMigration() public {
        isMigrating = false;
    }
    
    event FarmCreated(address indexed _address);
    event FarmSynced(address indexed _address);
    event ItemCrafted(address indexed _address, address _item);

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    function createFarm(address payable _charity) public payable {
        require(syncedAt[msg.sender] == 0, "FARM_EXISTS");

        uint decimals = token.decimals();

        require(
            // Donation must be at least $0.10 to play
            msg.value >= 2 * 10**(decimals - 2),
            "INSUFFICIENT_DONATION"
        );

        require(
            // The Water Project - double check
            _charity == address(0x060697E9d4EEa886EbeCe57A974Facd53A40865B)
            // Heifer
            || _charity == address(0xD3F81260a44A1df7A7269CF66Abd9c7e4f8CdcD1)
            // Cool Earth
            || _charity == address(0x3c8cB169281196737c493AfFA8F49a9d823bB9c5),
            "INVALID_CHARITY"
        );


        Square[] storage land = fields[msg.sender];
        Square memory empty = Square({
            fruit: ORE.None,
            createdAt: 0
        });
        Square memory sunflower = Square({
            fruit: ORE.Sunflower,
            createdAt: 0
        });

        // Each farmer starts with 5 fields & 3 Sunflowers
        land.push(empty);
        land.push(sunflower);
        land.push(sunflower);
        land.push(sunflower);
        land.push(empty);

        syncedAt[msg.sender] = block.timestamp;
        // They must wait X days before opening their first reward
        rewardsOpenedAt[msg.sender] = block.timestamp;

        (bool sent, bytes memory data) = _charity.call{value: msg.value}("");
        require(sent, "DONATION_FAILED");

        farmCount += 1;
            
        //Emit an event
        emit FarmCreated(msg.sender);
    }
    
    function lastSyncedAt(address owner) private view returns(uint) {
        return syncedAt[owner];
    }


    function getLand(address owner) public view returns (Square[] memory) {
        return fields[owner];
    }

    enum Action { Plant, Harvest }
    enum Fruit { None, Sunflower, Potato, Pumpkin, Beetroot, Cauliflower, Parsnip, Radish }

    struct Event { 
        Action action;
        Fruit fruit;
        uint landIndex;
        uint createdAt;
    }

    struct Farm {
        Square[] land;
        uint balance;
    }

    function getHarvestSeconds(Fruit _fruit) private pure returns (uint) {
        if (_fruit == ORE.Sunflower) {
            // 1 minute
            return 1 * 60;
        } else if (_fruit == ORE.Potato) {
            // 5 minutes
            return 5 * 60;
        } else if (_fruit == ORE.Pumpkin) {
            // 1 hour
            return 1  * 60 * 60;
        } else if (_fruit == ORE.Beetroot) {
            // 4 hours
            return 4 * 60 * 60;
        } else if (_fruit == ORE.Cauliflower) {
            // 8 hours
            return 8 * 60 * 60;
        } else if (_fruit == ORE.Parsnip) {
            // 1 day
            return 24 * 60 * 60;
        } else if (_fruit == ORE.Radish) {
            // 3 days
            return 3 * 24 * 60 * 60;
        }

        require(false, "INVALID_FRUIT");
        return 9999999;
    }

    function getSeedPrice(Fruit _fruit) private view returns (uint price) {
        uint decimals = token.decimals();

        if (_fruit == ORE.Sunflower) {
            //$0.01
            return 1 * 10**decimals / 100;
        } else if (_fruit == ORE.Potato) {
            // $0.10
            return 10 * 10**decimals / 100;
        } else if (_fruit == ORE.Pumpkin) {
            // $0.40
            return 40 * 10**decimals / 100;
        } else if (_fruit == ORE.Beetroot) {
            // $1
            return 1 * 10**decimals;
        } else if (_fruit == ORE.Cauliflower) {
            // $4
            return 4 * 10**decimals;
        } else if (_fruit == ORE.Parsnip) {
            // $10
            return 10 * 10**decimals;
        } else if (_fruit == ORE.Radish) {
            // $50
            return 50 * 10**decimals;
        }

        require(false, "INVALID_FRUIT");

        return 100000 * 10**decimals;
    }

    function getFruitPrice(Fruit _fruit) private view returns (uint price) {
        uint decimals = token.decimals();

        if (_fruit == ORE.Sunflower) {
            // $0.02
            return 2 * 10**decimals / 100;
        } else if (_fruit == ORE.Potato) {
            // $0.16
            return 16 * 10**decimals / 100;
        } else if (_fruit == ORE.Pumpkin) {
            // $0.80
            return 80 * 10**decimals / 100;
        } else if (_fruit == ORE.Beetroot) {
            // $1.8
            return 180 * 10**decimals / 100;
        } else if (_fruit == ORE.Cauliflower) {
            // $8
            return 8 * 10**decimals;
        } else if (_fruit == ORE.Parsnip) {
            // $16
            return 16 * 10**decimals;
        } else if (_fruit == ORE.Radish) {
            // $80
            return 80 * 10**decimals;
        }

        require(false, "INVALID_FRUIT");

        return 0;
    }
    
    function requiredLandSize(Fruit _fruit) private pure returns (uint size) {
        if (_fruit == ORE.Sunflower || _fruit == ORE.Potato) {
            return 5;
        } else if (_fruit == ORE.Pumpkin || _fruit == ORE.Beetroot) {
            return 8;
        } else if (_fruit == ORE.Cauliflower) {
            return 11;
        } else if (_fruit == ORE.Parsnip) {
            return 14;
        } else if (_fruit == ORE.Radish) {
            return 17;
        }

        require(false, "INVALID_FRUIT");

        return 99;
    }
    
       
    function getLandPrice(uint landSize) private view returns (uint price) {
        uint decimals = token.decimals();
        if (landSize <= 5) {
            // $1
            return 1 * 10**decimals;
        } else if (landSize <= 8) {
            // 50
            return 50 * 10**decimals;
        } else if (landSize <= 11) {
            // $500
            return 500 * 10**decimals;
        }
        
        // $2500
        return 2500 * 10**decimals;
    }

    modifier hasFarm {
        require(lastSyncedAt(msg.sender) > 0, "NO_FARM");
        _;
    }
     
    uint private THIRTY_MINUTES = 30 * 60;

    function buildFarm(Event[] memory _events) private view hasFarm returns (Farm memory currentFarm) {
        Square[] memory land = fields[msg.sender];
        uint balance = token.balanceOf(msg.sender);
        
        for (uint index = 0; index < _events.length; index++) {
            Event memory farmEvent = _events[index];

            uint thirtyMinutesAgo = block.timestamp.sub(THIRTY_MINUTES); 
            require(farmEvent.createdAt >= thirtyMinutesAgo, "EVENT_EXPIRED");
            require(farmEvent.createdAt >= lastSyncedAt(msg.sender), "EVENT_IN_PAST");
            require(farmEvent.createdAt <= block.timestamp, "EVENT_IN_FUTURE");

            if (index > 0) {
                require(farmEvent.createdAt >= _events[index - 1].createdAt, "INVALID_ORDER");
            }

            if (farmEvent.action == Action.Plant) {
                require(land.length >= requiredLandSize(farmEvent.fruit), "INVALID_LEVEL");
                
                uint price = getSeedPrice(farmEvent.fruit);
                uint fmcPrice = getMarketPrice(price);
                require(balance >= fmcPrice, "INSUFFICIENT_FUNDS");

                balance = balance.sub(fmcPrice);

                Square memory plantedSeed = Square({
                    fruit: farmEvent.fruit,
                    createdAt: farmEvent.createdAt
                });
                land[farmEvent.landIndex] = plantedSeed;
            } else if (farmEvent.action == Action.Harvest) {
                Square memory square = land[farmEvent.landIndex];
                require(square.fruit != ORE.None, "NO_FRUIT");

                uint duration = farmEvent.createdAt.sub(square.createdAt);
                uint secondsToHarvest = getHarvestSeconds(square.fruit);
                require(duration >= secondsToHarvest, "NOT_RIPE");

                // Clear the land
                Square memory emptyLand = Square({
                    fruit: ORE.None,
                    createdAt: 0
                });
                land[farmEvent.landIndex] = emptyLand;

                uint price = getFruitPrice(square.fruit);
                uint fmcPrice = getMarketPrice(price);

                balance = balance.add(fmcPrice);
            }
        }

        return Farm({
            land: land,
            balance: balance
        });
    }


    function sync(Event[] memory _events) public hasFarm returns (Farm memory) {
        Farm memory farm = buildFarm(_events);

        // Update the land
        Square[] storage land = fields[msg.sender];
        for (uint i=0; i < farm.land.length; i += 1) {
            land[i] = farm.land[i];
        }
        
        syncedAt[msg.sender] = block.timestamp;
        
        uint balance = token.balanceOf(msg.sender);
        // Update the balance - mint or burn
        if (farm.balance > balance) {
            uint profit = farm.balance.sub(balance);
            token.mint(msg.sender, profit);
        } else if (farm.balance < balance) {
            uint loss = balance.sub(farm.balance);
            token.burn(msg.sender, loss);
        }

        emit FarmSynced(msg.sender);

        return farm;
    }

    function levelUp() public hasFarm {
        require(fields[msg.sender].length <= 17, "MAX_LEVEL");

        
        Square[] storage land = fields[msg.sender];

        uint price = getLandPrice(land.length);
        uint fmcPrice = getMarketPrice(price);
        uint balance = token.balanceOf(msg.sender);

        require(balance >= fmcPrice, "INSUFFICIENT_FUNDS");
        
        // Store rewards in the Farm Contract to redistribute
        token.transferFrom(msg.sender, address(this), fmcPrice);
        
        // Add 3 sunflower fields in the new fields
        Square memory sunflower = Square({
            fruit: ORE.Sunflower,
            // Make them immediately harvestable in case they spent all their tokens
            createdAt: 0
        });

        for (uint index = 0; index < 3; index++) {
            land.push(sunflower);
        }

        emit FarmSynced(msg.sender);
    }

    // How many tokens do you get per dollar
    // Algorithm is totalSupply / 10000 but we do this in gradual steps to avoid widly flucating prices between plant & harvest
    function getMarketRate() private view returns (uint conversion) {
        uint decimals = token.decimals();
        uint totalSupply = token.totalSupply();

        // Less than 100, 000 tokens
        if (totalSupply < (100000 * 10**decimals)) {
            // 1 Farm Dollar gets you 1 FMC token
            return 1;
        }

        // Less than 500, 000 tokens
        if (totalSupply < (500000 * 10**decimals)) {
            return 5;
        }

        // Less than 1, 000, 000 tokens
        if (totalSupply < (1000000 * 10**decimals)) {
            return 10;
        }

        // Less than 5, 000, 000 tokens
        if (totalSupply < (5000000 * 10**decimals)) {
            return 50;
        }

        // Less than 10, 000, 000 tokens
        if (totalSupply < (10000000 * 10**decimals)) {
            return 100;
        }

        // Less than 50, 000, 000 tokens
        if (totalSupply < (50000000 * 10**decimals)) {
            return 500;
        }

        // Less than 100, 000, 000 tokens
        if (totalSupply < (100000000 * 10**decimals)) {
            return 1000;
        }

        // Less than 500, 000, 000 tokens
        if (totalSupply < (500000000 * 10**decimals)) {
            return 5000;
        }

        // Less than 1, 000, 000, 000 tokens
        if (totalSupply < (1000000000 * 10**decimals)) {
            return 10000;
        }

        // 1 Farm Dollar gets you a 0.00001 of a token - Linear growth from here
        return totalSupply.div(10000);
    }

    function getMarketPrice(uint price) public view returns (uint conversion) {
        uint marketRate = getMarketRate();

        return price.div(marketRate);
    }
    
    function getFarm(address account) public view returns (Square[] memory farm) {
        return fields[account];
    }
    
    function getFarmCount() public view returns (uint count) {
        return farmCount;
    }

    
    // Depending on the fields you have determines your cut of the rewards.
    function myReward() public view hasFarm returns (uint amount) {        
        uint lastOpenDate = rewardsOpenedAt[msg.sender];

        // Block timestamp is seconds based
        uint threeDaysAgo = block.timestamp.sub(60 * 60 * 24 * 3); 

        require(lastOpenDate < threeDaysAgo, "NO_REWARD_READY");

        uint landSize = fields[msg.sender].length;
        // E.g. $1000
        uint farmBalance = token.balanceOf(address(this));
        // E.g. $1000 / 500 farms = $2 
        uint farmShare = farmBalance / farmCount;

        if (landSize <= 5) {
            // E.g $0.2
            return farmShare.div(10);
        } else if (landSize <= 8) {
            // E.g $0.4
            return farmShare.div(5);
        } else if (landSize <= 11) {
            // E.g $1
            return farmShare.div(2);
        }
        
        // E.g $3
        return farmShare.mul(3).div(2);
    }

    function receiveReward() public hasFarm {
        uint amount = myReward();

        require(amount > 0, "NO_REWARD_AMOUNT");

        rewardsOpenedAt[msg.sender] = block.timestamp;

        token.transfer(msg.sender, amount);
    }

    /**
        Multi-token economy configurability below
     */
    // An in game material - Crafted Item, NFT or resource
    struct Material {
        address materialAddress;
        bool exists;
    }
    
    struct Cost {
        address materialAddress;
        uint amount;
    }

    struct Recipe {
        address outputAddress;
        Cost[] costs;
    }

    struct Resource {
        address outputAddress;
        address inputAddress;
    }

    mapping(address => Resource) resources;
    mapping(address => Recipe) recipes;
    mapping(address => Material) materials;

    // Put down a resource - tokens have their own mechanism for reflecting rewards
    function stake(address resourceAddress, uint amount) public {
        Material memory material = materials[resourceAddress];
        require(material.exists, "RESOURCE_DOES_NOT_EXIST");

        Resource memory resource = resources[resourceAddress];

        ERCItem(resource.inputAddress).burn(msg.sender, amount);


        // The resource contract will determine tokenomics and what to do with staked amount
        ERCItem(resource.outputAddress).stake(msg.sender, amount);
    }

    function createRecipe(address tokenAddress, Cost[] memory costs) public {
        require(tokenAddress != address(token), "SUNFLOWER_TOKEN_IN_USE");
        require(!materials[tokenAddress].exists, "RECIPE_ALREADY_EXISTS");

        // Ensure all materials are setup
        for (uint i=0; i < costs.length; i += 1) {
            address input = costs[i].materialAddress;
            Material memory material = materials[input];

            require(input == address(token) || material.exists, "MATERIAL_DOES_NOT_EXIST");
            
            recipes[tokenAddress].costs.push(costs[i]);
        }

        materials[tokenAddress] = Material({
            exists: true,
            materialAddress: tokenAddress
        });
    }

    function createResource(address resourceAddress, address requires) public {
        require(resourceAddress != address(token), "SUNFLOWER_TOKEN_IN_USE");
        require(!materials[resourceAddress].exists, "RESOURCE_ALREADY_EXISTS");

        // Check the required material is setup
        require(materials[requires].exists, "MATERIAL_DOES_NOT_EXIST");

        resources[resourceAddress] = Resource({
            outputAddress: resourceAddress,
            inputAddress: requires
        });
        
        materials[resourceAddress] = Material({
            exists: true,
            materialAddress: resourceAddress
        });
    }

    function burnCosts(address recipeAddress, uint total) private {
        Recipe memory recipe = recipes[recipeAddress];

        // ERC20 contracts will validate as needed
        for (uint i=0; i < recipe.costs.length; i += 1) {
            Cost memory cost = recipe.costs[i];

            uint price = cost.amount * total;
              
            // Never burn SFF - Store rewards in the Farm Contract to redistribute
            if (cost.materialAddress == address(token)) {
                token.transferFrom(msg.sender, address(this), price);
            } else {
                ERCItem(cost.materialAddress).burn(msg.sender, price);
            }
        }
    }

    function craft(address recipeAddress, uint amount) public {
        Material memory material = materials[recipeAddress];
                
        require(material.exists, "RECIPE_DOES_NOT_EXIST");
        
        burnCosts(recipeAddress, amount);

        ERCItem(recipeAddress).mint(msg.sender, amount);
        
        emit ItemCrafted(msg.sender, recipeAddress);
    }

    function mintNFT(address recipeAddress, uint tokenId) public {
        Material memory material = materials[recipeAddress];
                
        require(material.exists, "RECIPE_DOES_NOT_EXIST");

        burnCosts(recipeAddress, 1);

        ERCItem(recipeAddress).mint(msg.sender, tokenId);

        emit ItemCrafted(msg.sender, recipeAddress);
    }
    
    function getRecipe(address recipeAddress) public view returns (Recipe memory recipe) {
        return recipes[recipeAddress];
    }

    function getResource(address resourceAddress) public view returns (Resource memory resource) {
        return resources[resourceAddress];
    }
}
