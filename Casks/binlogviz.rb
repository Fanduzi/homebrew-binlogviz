cask "binlogviz" do
  version "0.25.0"

  on_macos do
    on_intel do
      sha256 "ebb0ed92b4a932c4af4e1455eb650322038cf9511ca2707b67ef27879b0de7e6"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.25.0/binlogviz_0.25.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "fe71b9878b72e889341827ac0d131e593675a51f92e696ce6a368d75d4158e92"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.25.0/binlogviz_0.25.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "3a5de5780cf2216c28fd5c5ce0f5cc085d4c7e752efb66904a2ee26354bd5753"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.25.0/binlogviz_0.25.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "85692c6a55e28a7a15540c67f6bae5bfd564345ba0ddfccbf56974dcc8fa9cff"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.25.0/binlogviz_0.25.0_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
