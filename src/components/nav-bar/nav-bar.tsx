import React from 'react';
import styles from './nav-bar.module.css';
import { HStack } from "@chakra-ui/react"
import { SegmentedControl } from "@/components/ui/segmented-control"
import { Button } from "@/components/ui/button"
import { HiOutlineCloudDownload, HiOutlineCloudUpload } from "react-icons/hi";
const NavBar: React.FC = () => {
  return (
    <>
      <div className={styles.navBar}>

        <div className={styles.leftSection}>
          <span className={styles.brandName}>Web3-Email</span>
          <SegmentedControl items={[
            {
              value: "inbox",
              label: (
                <HStack>
                  <HiOutlineCloudDownload />
                  Inbox
                </HStack>
              ),
            },
            {
              value: "outbox",
              label: (
                <HStack>
                  <HiOutlineCloudUpload />
                  Outbox
                </HStack>
              ),
            },
           
          ]} defaultValue={'Inbox'}  />
        </div>

        <div className={styles.rightSection}>
          <Button colorPalette="accent" variant="solid">Compose</Button>
        </div>
        
      </div>
    </>
  );
};

export default NavBar;
