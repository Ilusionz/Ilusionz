#include "..\..\script_macros.hpp"
/*
    File: fn_debitCheck.sqf
    Author: Ilusionz

    Description:
    Master file for script execution if a player does/doesn't have a debit card.
	There's probably better ways to do it, I know.
*/
private ["_mode"];
_mode = param [0,0,[0]];

switch (_mode) do {
	case 0: {
		if ((LIFE_SETTINGS(getNumber,"debit_clothing") isEqualTo 1) && (life_has_debit isEqualTo true)) then {
			[] call life_fnc_buyClothesDebit;
		} else {
			[] call life_fnc_buyClothes;
			};
		};
	
	case 1: {
		if ((LIFE_SETTINGS(getNumber,"debit_weapons") isEqualTo 1) && (life_has_debit isEqualTo true)) then {
			[] spawn life_fnc_weaponShopBuySellDebit; true;
		} else {
			[] spawn life_fnc_weaponShopBuySell; true;
			};
		};
	
	case 2: {
		if ((LIFE_SETTINGS(getNumber,"debit_vItems") isEqualTo 1) && (life_has_debit isEqualTo true)) then {
			[] spawn life_fnc_virt_buyDebit;
		} else {
			[] spawn life_fnc_virt_buy;
			};
		};
	
	case 3: {
		if ((LIFE_SETTINGS(getNumber,"debit_vehicles") isEqualTo 1) && (life_has_debit isEqualTo true)) then {
			[true] spawn life_fnc_vehicleShopBuyDebit;
		} else {
			[true] spawn life_fnc_vehicleShopBuy;
			};
		};
	
	case 4: {
		if ((LIFE_SETTINGS(getNumber,"debit_vItems") isEqualTo 1) && (life_has_debit isEqualTo true)) then {
			[] call life_fnc_virt_sellDebit;
		} else {
			[] call life_fnc_virt_sell;
			};
		};
	
	case 5: {
		if ((LIFE_SETTINGS(getNumber,"debit_vehicles") isEqualTo 1) && (life_has_debit isEqualTo true)) then {
			[false] spawn life_fnc_vehicleShopBuyDebit;
		} else {
			[false] spawn life_fnc_vehicleShopBuy;
			};
		};
	};