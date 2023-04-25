const { ethers } = require("hardhat");
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
const { expect } = require("chai");

describe("Array", () => {
    async function deployArray() {
        const Array = await ethers.getContractFactory("Array");
        const array = await Array.deploy();
        await array.deployed();
        return { array };
    }

    it("Should have a length of 8", async () => {
        const { array } = await loadFixture(deployArray);
        const initialLength = await array.getArrayLength();
        console.log(`Length before deleting: ${initialLength}. Items are:`);
        for (let i = 0; i < initialLength; i++) {
            console.log((await array.myDynamicArray(i)).toString());
        }
        // Delete the items at indexes 8, 2 and 7.
        let tx = await array.deleteAtIndex(8);
        await tx.wait();
        tx = await array.deleteAtIndex(2);
        await tx.wait();
        tx = await array.deleteAtIndex(7);
        await tx.wait();

        // Print the length and the items after deleting.
        const finalLength = await array.getArrayLength();
        console.log(`Length after deleting: ${finalLength}. Items are:`);
        for (let i = 0; i < finalLength; i++) {
            console.log((await array.myDynamicArray(i)).toString());
        }

        // Verify that the length is 9.
        const length = await array.getArrayLength();
        expect(length).to.equal(9);
    });
});
